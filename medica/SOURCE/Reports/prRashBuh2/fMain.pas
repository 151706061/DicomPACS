unit fMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, Buttons, ActnList, ImgList,
  ComCtrls, ToolWin, Db, OracleData, Oracle, FR_DSet, FR_Class, FR_DBSet,
  DBCtrls, frXMLExl, frOLEExl, HtmlHlp, JvComponentBase, JvFormPlacement,
  JvExMask, JvToolEdit, OracleMonitor, JvAppStorage, Menus, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxSpinEdit, cxCurrencyEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  JvExControls, JvArrowButton, cxContainer, cxGroupBox, cxCheckBox,
  Contnrs, dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter,
  cxLookAndFeelPainters, cxGridBandedTableView, cxGridDBBandedTableView,
  frxClass, frxDBSet, frxExportXLS;

const
  FR2 = 'FR2';
  FR4 = 'FR4';
  ExeFileName = 'prRashBuh.exe';

type
  TReportItem = class
    FR_Type : string;
    RusName : string;
    EngSynonim : string;
    ReportFileName : string;
    cxGridDBTableView : TcxGridTableView;
    DataSet : TOracleDataset;
    Visible : boolean;

    constructor Create(aFR_Type, aRusName, aEngSynonim, aReportFileName: string; aDataSet : TOracleDataset; acxGridDBTableView: TcxGridTableView; aVisible: boolean = True);
  end;

  TfrmMain = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    tbuPrint: TToolButton;
    ToolButton2: TToolButton;
    alAll: TActionList;
    FormStorage1: TJvFormStorage;
    acPrint: TAction;
    aCancel: TAction;
		os: TOracleSession;
    odsSelDocRashRep: TOracleDataSet;
    odsSelDocPoMedic: TOracleDataSet;
    frRashDocPoMedic: TfrReport;
    frRashDocPoDOC: TfrReport;
    frRashDocITOG: TfrReport;
    frRashDocPoMedicType: TfrReport;
    odsSelDocPoMedicType: TOracleDataSet;
    odsNacenkaUcenka: TOracleDataSet;
    frDBNacenkaUcenka: TfrDBDataSet;
    pmUchGr: TPopupMenu;
    miAllUchGr: TMenuItem;
    N2: TMenuItem;
    odsUchGr: TOracleDataSet;
    oqInitMO: TOracleQuery;
    ilImages: TImageList;
    cxGrid1: TcxGrid;
    grViewRashDocPoMedic: TcxGridDBTableView;
    grViewRashDocPoMedicFN_PRICE_MASTER: TcxGridDBColumn;
    grViewRashDocPoMedicFP_VIDMOVE: TcxGridDBColumn;
    grViewRashDocPoMedicPOSTAVID: TcxGridDBColumn;
    grViewRashDocPoMedicMOTOID: TcxGridDBColumn;
    grViewRashDocPoMedicMOFROMID: TcxGridDBColumn;
    grViewRashDocPoMedicFC_COMMENT: TcxGridDBColumn;
    grViewRashDocPoMedicFP_VID: TcxGridDBColumn;
    grViewRashDocPoMedicMOOWNERID: TcxGridDBColumn;
    grViewRashDocPoMedicDPID: TcxGridDBColumn;
    grViewRashDocPoMedicFC_DOC: TcxGridDBColumn;
    grViewRashDocPoMedicDATA: TcxGridDBColumn;
    grViewRashDocPoMedicFD_DATA: TcxGridDBColumn;
    grViewRashDocPoMedicNAMEPOSTAV: TcxGridDBColumn;
    grViewRashDocPoMedicDPID_1: TcxGridDBColumn;
    grViewRashDocPoMedicDPCID: TcxGridDBColumn;
    grViewRashDocPoMedicMEDICID: TcxGridDBColumn;
    grViewRashDocPoMedicNAMEKART: TcxGridDBColumn;
    grViewRashDocPoMedicFC_SERIAL: TcxGridDBColumn;
    grViewRashDocPoMedicFC_EDIZM: TcxGridDBColumn;
    grViewRashDocPoMedicFN_KOL: TcxGridDBColumn;
    grViewRashDocPoMedicFN_PRICE_DETAIL: TcxGridDBColumn;
    grViewRashDocPoMedicFN_SUMM: TcxGridDBColumn;
    grViewRashDocPoMedicKARTID: TcxGridDBColumn;
    grViewRashDocPoMedicFC_RANG_ORDER: TcxGridDBColumn;
    grViewRashPoluch: TcxGridDBTableView;
    grViewRashPoluchFC_MO_GR_TO: TcxGridDBColumn;
    grViewRashPoluchFN_PRICE: TcxGridDBColumn;
    grViewRashPoluchRANG: TcxGridDBColumn;
    grViewRashPoluchFC_RANG: TcxGridDBColumn;
    grViewRashDocPoDOC: TcxGridDBTableView;
    grViewRashDocPoDOCVIDDOC: TcxGridDBColumn;
    grViewRashDocPoDOCFC_DOC: TcxGridDBColumn;
    grViewRashDocPoDOCFN_PRICE: TcxGridDBColumn;
    grViewRashDocPoDOCFC_COMMENT: TcxGridDBColumn;
    grViewRashDocPoDOCMOOWNERID: TcxGridDBColumn;
    grViewRashDocPoDOCDATA: TcxGridDBColumn;
    grViewRashDocPoDOCFD_INVOICE: TcxGridDBColumn;
    grViewRashDocPoDOCFC_NAME: TcxGridDBColumn;
    grViewRashDocPoDOCFC_MO_GR_TO: TcxGridDBColumn;
    grViewRashDocPoDOCNAMEPOSTAV: TcxGridDBColumn;
    grViewRashDocPoDOC_DPID: TcxGridDBColumn;
    grViewRashDocPoMedicType: TcxGridDBTableView;
    grViewRashDocPoMedicTypeFN_PRICE_MASTER: TcxGridDBColumn;
    grViewRashDocPoMedicTypeFP_VIDMOVE: TcxGridDBColumn;
    grViewRashDocPoMedicTypePOSTAVID: TcxGridDBColumn;
    grViewRashDocPoMedicTypeMOTOID: TcxGridDBColumn;
    grViewRashDocPoMedicTypeMOFROMID: TcxGridDBColumn;
    grViewRashDocPoMedicTypeFC_COMMENT: TcxGridDBColumn;
    grViewRashDocPoMedicTypeFP_VID: TcxGridDBColumn;
    grViewRashDocPoMedicTypeMOOWNERID: TcxGridDBColumn;
    grViewRashDocPoMedicTypeDPID: TcxGridDBColumn;
    grViewRashDocPoMedicTypeDATA: TcxGridDBColumn;
    grViewRashDocPoMedicTypeFD_DATA: TcxGridDBColumn;
    grViewRashDocPoMedicTypeDPID_1: TcxGridDBColumn;
    grViewRashDocPoMedicTypeDPCID: TcxGridDBColumn;
    grViewRashDocPoMedicTypeMEDICID: TcxGridDBColumn;
    grViewRashDocPoMedicTypeNAMEKART: TcxGridDBColumn;
    grViewRashDocPoMedicTypeFC_EDIZM: TcxGridDBColumn;
    grViewRashDocPoMedicTypeFC_SERIAL: TcxGridDBColumn;
    grViewRashDocPoMedicTypeFC_DOC: TcxGridDBColumn;
    grViewRashDocPoMedicTypeFC_MEDICTYPE: TcxGridDBColumn;
    grViewRashDocPoMedicTypeNAMEPOSTAV: TcxGridDBColumn;
    grViewRashDocPoMedicTypeFN_KOL: TcxGridDBColumn;
    grViewRashDocPoMedicTypeFN_PRICE_DETAIL: TcxGridDBColumn;
    grViewRashDocPoMedicTypeFN_SUMM: TcxGridDBColumn;
    grViewRashDocPoMedicTypeKARTID: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxGroupBox2: TcxGroupBox;
    cmbReport: TcxComboBox;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    dsGrid: TDataSource;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    tbuTableToExcel: TToolButton;
    tbuUchGrSep: TToolButton;
    tbuUchGrSelect: TToolButton;
    tbuRPO: TToolButton;
    chbRPO: TcxCheckBox;
    tbuProfilSep: TToolButton;
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
    acGridToExcel: TAction;
    odsSelDocRashPoluch: TOracleDataSet;
    sd: TSaveDialog;
    MainMenu1: TMainMenu;
    miPeriod: TMenuItem;
    miMO_GROUP: TMenuItem;
    odsGroupMo: TOracleDataSet;
    odsRashByUchgr_FincSrc: TOracleDataSet;
    grViewRashActSpisMatZap: TcxGridDBBandedTableView;
    grViewRashActSpisMatZap_MEDICNAME: TcxGridDBBandedColumn;
    grViewRashActSpisMatZapColumn2: TcxGridDBBandedColumn;
    grViewRashActSpisMatZapColumn3: TcxGridDBBandedColumn;
    grViewRashActSpisMatZap_FC_EDIZM: TcxGridDBBandedColumn;
    grViewRashActSpisMatZap_rownum: TcxGridDBBandedColumn;
    grViewRashActSpisMatZap_FN_KOL: TcxGridDBBandedColumn;
    grViewRashActSpisMatZap_FN_PRICE: TcxGridDBBandedColumn;
    grViewRashActSpisMatZap_FN_SUMM: TcxGridDBBandedColumn;
    grViewRashActSpisMatZap_FC_RASH: TcxGridDBBandedColumn;
    grViewRashActSpisMatZapColumn11: TcxGridDBBandedColumn;
    grViewRashActSpisMatZapColumn12: TcxGridDBBandedColumn;
    grViewRashActSpisMatZapColumn13: TcxGridDBBandedColumn;
    grViewRashActSpisMatZapColumn14: TcxGridDBBandedColumn;
    tbuFinSource: TToolButton;
    pmFinSource: TPopupMenu;
    miAllFinSource: TMenuItem;
    MenuItem2: TMenuItem;
    tbuFinSourceSep: TToolButton;
    odsFinSource: TOracleDataSet;
    frRashByUchgr_FincSrc: TfrReport;
    frxReport1: TfrxReport;
    frxDBNacenkaUcenka: TfrxDBDataset;
    frxDBReport1: TfrxDBDataset;
    oqPKG_SMINI: TOracleQuery;
    frRashDocPoMedicFinSource: TfrReport;
    odsSelDocPoMedicFinSource: TOracleDataSet;
    frxRashDocPoMedicFinSource: TfrxReport;
    grViewRashDocPoMedicFinSource: TcxGridDBTableView;
    grViewRashDocPoMedicFinSource_MEDICNAME: TcxGridDBColumn;
    grViewRashDocPoMedicFinSource_FC_EDIZM: TcxGridDBColumn;
    grViewRashDocPoMedicFinSource_FN_KOL: TcxGridDBColumn;
    grViewRashDocPoMedicFinSource_FN_PRICE: TcxGridDBColumn;
    grViewRashDocPoMedicFinSource_FN_SUMM: TcxGridDBColumn;
    grViewRashDocPoMedicFinSource_FC_FINSOURCE: TcxGridDBColumn;
    odsSelDocPoMedicFinSource_DS: TOracleDataSet;
    odsSelDocPoFinSource: TOracleDataSet;
    frRashDocPoFinSource: TfrReport;
    grViewRashDocPoFinSource: TcxGridDBTableView;
    grViewRashDocPoFinSourceMOFROMID: TcxGridDBColumn;
    grViewRashDocPoFinSourceFC_COMMENT: TcxGridDBColumn;
    grViewRashDocPoFinSourceFP_VID: TcxGridDBColumn;
    grViewRashDocPoFinSourceFN_PRICE_MASTER: TcxGridDBColumn;
    grViewRashDocPoFinSourceMOOWNERID: TcxGridDBColumn;
    grViewRashDocPoFinSourceDPID: TcxGridDBColumn;
    grViewRashDocPoFinSourceFC_DOC: TcxGridDBColumn;
    grViewRashDocPoFinSourceFC_MO_GR_TO: TcxGridDBColumn;
    grViewRashDocPoFinSourceNAMEFROM: TcxGridDBColumn;
    grViewRashDocPoFinSourceDATA: TcxGridDBColumn;
    grViewRashDocPoFinSourceMOTOID: TcxGridDBColumn;
    grViewRashDocPoFinSourceDPID_1: TcxGridDBColumn;
    grViewRashDocPoFinSourceDPCID: TcxGridDBColumn;
    grViewRashDocPoFinSourceMEDICID: TcxGridDBColumn;
    grViewRashDocPoFinSourceFN_KOL: TcxGridDBColumn;
    grViewRashDocPoFinSourceFN_SUMM: TcxGridDBColumn;
    grViewRashDocPoFinSourceFN_PRICE_DETAIL: TcxGridDBColumn;
    grViewRashDocPoFinSourceKARTID: TcxGridDBColumn;
    grViewRashDocPoFinSourceFC_FINSOURCE: TcxGridDBColumn;
    grViewRashDocPoFinSourceMEDICNAME: TcxGridDBColumn;
    grViewRashDocPoFinSourceFN_PARTY_NUM: TcxGridDBColumn;
    grViewRashDocPoFinSourceNAMEKART: TcxGridDBColumn;
    grViewRashDocPoFinSourceFC_SERIAL: TcxGridDBColumn;
    grViewRashDocPoFinSourceFC_EDIZM: TcxGridDBColumn;
    grViewRashDocPoFinSourceFC_MEDICTYPE: TcxGridDBColumn;
    grViewRashDocPoFinSourceFC_KOL: TcxGridDBColumn;
    grViewRashDocPoDOCFC_FINSOURCE: TcxGridDBColumn;
    grViewRashDocPoMedicTypeFC_FINSOURCE: TcxGridDBColumn;
    frxRashDocITOG: TfrxReport;
    frxdsSelDocRashPoluch: TfrxDBDataset;
    frxRashDocPoDOC: TfrxReport;
    frxRashDocPoMedic: TfrxReport;
    frxRashDocPoMedicType: TfrxReport;
    frxRashDocPoFinSource: TfrxReport;
    ToolButton1: TToolButton;
    tbuProfil: TToolButton;
    pmProfil: TPopupMenu;
    miAllProfil: TMenuItem;
    MenuItem3: TMenuItem;
    odsProfil: TOracleDataSet;
    odsSelDocPoProfil: TOracleDataSet;
    frxRashDocPoProfil: TfrxReport;
    grViewRashDocPoProfil: TcxGridDBTableView;
    grViewRashDocPoProfilMOFROMID: TcxGridDBColumn;
    grViewRashDocPoProfilFC_COMMENT: TcxGridDBColumn;
    grViewRashDocPoProfilFP_VID: TcxGridDBColumn;
    grViewRashDocPoProfilFN_PRICE_MASTER: TcxGridDBColumn;
    grViewRashDocPoProfilMOOWNERID: TcxGridDBColumn;
    grViewRashDocPoProfilDPID: TcxGridDBColumn;
    grViewRashDocPoProfilFC_DOC: TcxGridDBColumn;
    grViewRashDocPoProfilFC_MO_GR_TO: TcxGridDBColumn;
    grViewRashDocPoProfilNAMEFROM: TcxGridDBColumn;
    grViewRashDocPoProfilDATA: TcxGridDBColumn;
    grViewRashDocPoProfilMOTOID: TcxGridDBColumn;
    grViewRashDocPoProfilDPID_1: TcxGridDBColumn;
    grViewRashDocPoProfilDPCID: TcxGridDBColumn;
    grViewRashDocPoProfilMEDICID: TcxGridDBColumn;
    grViewRashDocPoProfilFN_KOL: TcxGridDBColumn;
    grViewRashDocPoProfilFN_SUMM: TcxGridDBColumn;
    grViewRashDocPoProfilFN_PRICE_DETAIL: TcxGridDBColumn;
    grViewRashDocPoProfilKARTID: TcxGridDBColumn;
    grViewRashDocPoProfilMEDICNAME: TcxGridDBColumn;
    grViewRashDocPoProfilFN_PARTY_NUM: TcxGridDBColumn;
    grViewRashDocPoProfilNAMEKART: TcxGridDBColumn;
    grViewRashDocPoProfilFC_FINSOURCE: TcxGridDBColumn;
    grViewRashDocPoProfilFC_SERIAL: TcxGridDBColumn;
    grViewRashDocPoProfilFC_EDIZM: TcxGridDBColumn;
    grViewRashDocPoProfilFC_MEDICTYPE: TcxGridDBColumn;
    grViewRashDocPoProfilFC_KOL: TcxGridDBColumn;
    grViewRashDocPoProfilFC_PROFIL: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure acPrintExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure frReport1UserFunction(const Name: String; p1, p2,
      p3: Variant; var Val: Variant);
    procedure odsGroupMoAfterOpen(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure frRashDocITOGGetValue(const ParName: String;
      var ParValue: Variant);
    procedure lcbMO_GROUPCloseUp(Sender: TObject);
    procedure odsUchGrAfterOpen(DataSet: TDataSet);
    procedure miAllUchGrClick(Sender: TObject);
    procedure cmbReportPropertiesChange(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure chbRPOClick(Sender: TObject);
    procedure tbuUchGrSelectClick(Sender: TObject);
    procedure acGridToExcelExecute(Sender: TObject);
    procedure miPeriodClick(Sender: TObject);
    procedure miMO_GROUPClick(Sender: TObject);
    procedure tbuFinSourceClick(Sender: TObject);
    procedure miAllFinSourceClick(Sender: TObject);
    procedure odsFinSourceAfterOpen(DataSet: TDataSet);
    procedure frxReport1GetValue(const VarName: string; var Value: Variant);
    function frxReport1UserFunction(const MethodName: string;
      var Params: Variant): Variant;
    procedure frReport1MouseOverObject(View: TfrView; var Cursor: TCursor);
    procedure frReport1ObjectClick(View: TfrView);
    procedure odsProfilAfterOpen(DataSet: TDataSet);
    procedure miAllProfilClick(Sender: TObject);
  private
    { Private declarations }
    FLang: array[0..KL_NAMELENGTH] of char; //Раскладка клавиатуры
    FUchGrID : Integer;
    FFinSourceID : integer;
    FProfilID    : integer;
    FFC_FIN_SOURCE : string;
    FFC_PROFIL     : string;
    FDate1, FDate2 : TDateTime;
    FCurMOGroup : integer;
    FCurMOGroupName : string;

    function GetGroupRow(AText: String): String;
    function GetEndGroupRow(AText, aSumm: String): String;
    function GetRow(aNum, aName, aEdIzm, aDate, aDoc, aPoluch, aKol, aPrice, aSumm: String): String;
    procedure MakeExcelReportUchGr(aFileName, aGroupFieldName : string);
    procedure MakeExcelReportFinSource(aFileName, aGroupFieldName: string);
    procedure MakeExcelReportMed(aFileName: string);

    procedure OnBeforeSelectReporProc;
    procedure OnBeforeOpenReportProc;
    procedure OnAfterLoadReportFile;
    procedure OnAfterShowReportProc;

    procedure SetMOGroup( aMOGroup : integer);
    function READSTRING_TSMINI(aFC_SECTION, aFC_KEY,
      aFC_DEFAULT_VALUE: string): string;
    function WRITESTRING_TSMINI(aFC_SECTION, aFC_KEY,
      aFC_VALUE: string): string;
  public
    { Public declarations }
    IS_RPO : Integer;
    ReportsList : TObjectList;
    Report : TReportItem;

    FZaklKom, FSpisano,
    FPred, FKom1, FKom2, FKom3, FMO, FDolMO, FUTVERJDAYU_FIO, FUTVERJDAYU_DOLJN,
    FDolPred, FDolKom1, FDolKom2, FDolKom3, FPrikaz  : string;

    property CurMOGroup : integer read FCurMOGroup write SetMOGroup;

  end;

  function MoneyToString(Summa: double; lRub: boolean): string;
  function IniWriteString2(Section, Ident: string; Value: string) : integer;  
  
var
  frmMain: TfrmMain;
  iniFileName: string;

implementation
uses IniFiles, fdmPrintSelect, ComObj, Excel2000, uReportParams, ShellAPI,
     uGlobal, DateUtils, cxGridExportLink, fGetPeriod, fGetMOGroup, SMMainAPI,
     fr_view, fr_const, fr_utils, fReportInputActSpis;     
{$R *.DFM}
          

function EncodeStringToHex(aStr: string): string;
var
  i, Len : Integer;
begin
  Result := '';
  Len := Length(aStr);
  for i := 1 to Len do
    Result := Result+IntToHex(Ord(aStr[i]), 2);
end;
//------------------------------------------------------------------------------
function EncodeHexToString(aHexStr: string): string;
var
  i, Len : Integer;

  function HexToByte(aHex : string) : Byte;
  var
    res : byte;
  begin
    res := 0;
    case aHex[2] of
      '0'..'9' : res := Ord(aHex[2])-48;
      'A'..'F' : res := Ord(aHex[2])-55;
      'a'..'f' : res := Ord(aHex[2])-87;
    end;

    case aHex[1] of
      '0'..'9' : res := res+ (Ord(aHex[1])-48)*16;
      'A'..'F' : res := res+ (Ord(aHex[1])-55)*16;
      'a'..'f' : res := res+ (Ord(aHex[1])-87)*16;
    end;
    Result := res;
  end;
begin
  Result := '';
  Len := Length(aHexStr) div 2;
  for i := 1 to Len do
    Result := Result+Chr(HexToByte(aHexStr[(i*2)-1]+aHexStr[i*2]));
end;
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

function IniWriteString2(Section, Ident: string; Value: string) : integer;
begin
//  JvAppIniFileStorage.Flush;
  IniWriteString(iniFileName, Section, Ident, Value);
//  dmMain.JvAppIniFileStorage.Reload;
  Result := 0;
end;
//==============================================================================
function MoneyToString(Summa: double; lRub: boolean): string;
const
    TysStr: array[1..4] of string = ('', 'две', 'три', 'четыре');
    Ed2_4Str: array[2..4] of string = ('два', 'три', 'четыре');
    Ed5_19Str: array[5..19] of string = ('пять', 'шесть', 'семь', 'восемь', 'девять',
        'десять', 'одиннадцать', 'двенадцать', 'тpинадцать',
        'четыpнадцать', 'пятнадцать', 'шестнадцать', 'семнадцать',
        'восемнадцать', 'девятнадцать');
    DesStr: array[2..9] of string = ('двадцать', 'тpидцать', 'соpок', 'пятьдесят', 'шестьдесят',
        'семьдесят', 'восемьдесят', 'девяносто');
    SotStr: array[1..9] of string = ('сто', 'двести', 'тpиста', 'четыpеста', 'пятьсот', 'шестьсот',
        'семьсот', 'восемьсот', 'девятьсот');

    function MakeStr(C: Char; N: Integer): string;
    begin
      if N < 1 then Result := ''
      else begin
    {$IFNDEF WIN32}
				if N > 255 then N := 255;
    {$ENDIF WIN32}
        SetLength(Result, N);
        FillChar(Result[1], Length(Result), C);
      end;
    end;

    function AddChar(C: Char; const S: string; N: Integer): string;
    begin
      if Length(S) < N then
        Result := MakeStr(C, N - Length(S)) + S
      else Result := S;
    end;

    function KopToStr(Kop: integer): string;
    var
        sRet: string;
    begin
        sRet := '';
        sRet := AddChar('0', IntToStr(Kop), 2);
        case Kop of
            1, 21, 31, 41, 51, 61, 71, 81, 91: sRet := sRet + ' копейка';
            0, 5..20, 25..30, 35..40, 45..50, 55..60, 65..70, 75..80, 85..90, 95..99: sRet := sRet + ' копеек';
            2..4, 22..24, 32..34, 42..44, 52..54, 62..64, 72..74, 82..84, 92..94: sRet := sRet + ' копейки';
        end;
        KopToStr := sRet;
    end;

var
    ResStr, ST: string;
    Rub: integer;
		Kop: integer;
    Desed, Des: integer;
    Mil, Tys, Sot: integer;
begin
    ResStr := '';
    if Summa > 999999999.99 then
        exit;

    Rub := Trunc(Summa);
    Mil := Trunc(Rub / 1000000);
    Tys := Trunc(Rub / 1000) - Mil * 1000;
    Kop := round((Summa - Rub) * 100);  

    Rub := Rub - Tys * 1000 - Mil * 1000000;

   // миллионы
    if Mil > 0 then begin
        Sot := trunc(Mil / 100);
        if Sot > 0 then
            ResStr := ResStr + SotStr[Sot] + ' ';
        Desed := Mil - 100 * Sot;
//        Des := 0; - убрал вылазит хинт Воронов О.А.
        while true do
            case DESED of
                0: begin
                        ResStr := ResStr + 'миллионов ';
                        Break;
                    end;
                1: begin
                        ResStr := ResStr + 'один миллион ';
                        Break;
                    end;
                2..4: begin
												ResStr := ResStr + ED2_4STR[DESED] + ' миллиона ';
                        Break;
                    end;
                5..19: begin
                        ResStr := ResStr + ED5_19STR[DESED] + ' миллионов ';
                        Break;
                    end;
            else begin
                    Des := Trunc(DESED / 10);
                    ResStr := ResStr + DESSTR[DES] + ' ';
                    DESED := DESED - 10 * DES;
                end;
            end;
    end;
   //тысячи
    if Tys > 0 then begin
        SOT := Trunc(Tys / 100);
        if SOT > 0 then
            ResStr := ResStr + SOTSTR[SOT] + ' ';
        DESED := TYS - 100 * SOT;
//        Des := 0; - убрал вылазит хинт Воронов О.А.
        while true do
            case DESED of
                0: begin
                        ResStr := ResStr + 'тысяч ';
                        Break;
                    end;
                1: begin
                        ResStr := ResStr + 'одна тысяча ';
                        Break;
										end;
                2..4: begin
                        ResStr := ResStr + TYSSTR[DESED] + ' тысячи ';
                        Break;
                    end;
                5..19: begin
                        ResStr := ResStr + ED5_19STR[DESED] + ' тысяч ';
                        Break;
                    end;
            else begin
                    Des := Trunc(DESED / 10);
                    ResStr := ResStr + DESSTR[DES] + ' ';
                    DESED := DESED - 10 * DES;
                end;
            end;
    end;
   //сотни
    SOT := Trunc(RUB / 100);
    if SOT > 0 then
        ResStr := ResStr + SOTSTR[SOT] + ' ';
    DESED := RUB - 100 * SOT;
//    Des := 0; - убрал вылазит хинт Воронов О.А.
    if Summa < 1 then
        ResStr := 'ноль';
    while true do
        case DESED of
            0: Break;
            1: begin
                    ResStr := ResStr + 'один';
                    Break;
                end;
						2..4: begin
                    ResStr := ResStr + ED2_4STR[DESED];
                    Break;
                end;
            5..19: begin
                    ResStr := ResStr + ED5_19STR[DESED];
                    Break;
                end;
        else begin
                Des := Trunc(DESED / 10);
                ResStr := ResStr + DESSTR[DES] + ' ';
                DESED := DESED - 10 * DES;
            end;
        end;
    case DESED of
        0, 5..19: ST := ' pублей ';
        1: ST := ' pубль ';
        2..4: ST := ' pубля ';
    end;
    if lRub then begin
        ResStr := ResStr + ST;
        ResStr := ResStr + KopToStr(Kop);
    end;
    ResStr := AnsiUpperCase(ResStr[1]) + copy(ResStr, 2, Length(ResStr) - 1);
    Result := ResStr;
end;
//==============================================================================

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

procedure TfrmMain.FormCreate(Sender: TObject);
var FK_APPSOTR_ID, i: integer;
  AppExeName : string;
  UchGrIdStr : string;
begin
  try
//    os.LogOn;
    GetSession(os, 'ASU');
  except
    Application.MessageBox('Нет соединения с базой данных!','Ошибка',mb_ok + mb_iconerror);
    Application.Terminate;
    Abort;
  end;

  IS_RPO := 0;

  iniFileName := Application.ExeName+'.ini';

  if TryStrToInt(ParamStr(1), FK_APPSOTR_ID) = False then
    FK_APPSOTR_ID := -1;
  oqInitMO.SetVariable('PAPPSOTRID', FK_APPSOTR_ID);
  oqInitMO.Execute;

  FCurMOGroup := -1;
  FCurMOGroupName := '';
  odsGroupMo.Close;
  odsGroupMo.Open;
  CurMOGroup := oqInitMO.GetVariable('NMO_GROUP');
  miMO_GROUP.Enabled := (oqInitMO.GetVariable('PFL_PROVIZOR') = 1);
//  lcbMO_GROUP.KeyValue :=  oqInitMO.GetVariable('NMO_GROUP');
//  lcbMO_GROUP.Enabled  :=  (oqInitMO.GetVariable('PFL_PROVIZOR') = 1);

  //Запоминаем текущюю раскладку
  GetKeyboardLayoutName(FLang);
  //Загружаем русскую раскладку клавиатуры
  LoadKeyboardLayout(PChar('00000419'), KLF_ACTIVATE);
  self.Caption := Application.Title;

  FUchGrID := -1;
  odsUchGr.Open;

  FFinSourceID := -1;
  FFC_FIN_SOURCE := miAllFinSource.Caption;
  odsFinSource.Open;  

  FProfilID := -1;
  FFC_PROFIL := miAllProfil.Caption;
  odsProfil.Open;

  // динамические отчеты - общий список
  ReportsList := TObjectList.Create(True);
  //ReportsList.Add( TReportItem.Create(FR2, 'Отчет по расходу по получателям',      'RepRashPoluch',         'frRashDocPoPoluch.frf',     odsSelDocRashPoluch,    grViewRashPoluch)         );
  //ReportsList.Add( TReportItem.Create(FR2, 'Отчет по расходу (по документам)',     'RepRashDocPoDOC',       'frRashDocPoDOC.frf',        odsSelDocRashRep,       grViewRashDocPoDOC)       );
  //ReportsList.Add( TReportItem.Create(FR2, 'Отчет по расходу (по объектам учета)', 'RepRashDocPoMedic',     'frRashDocPoMedic.frf',      odsSelDocPoMedic,       grViewRashDocPoMedic)     );
  //ReportsList.Add( TReportItem.Create(FR2, 'Отчет по расходу (по учетным группам)','RepRashDocPoMedicType', 'frRashDocPoMedicType.frf',  odsSelDocPoMedicType,   grViewRashDocPoMedicType) );
  //ReportsList.Add( TReportItem.Create(FR2, 'Отчет по расходу (по источникам финансирования)','RepRashDocPoFinSource', 'frRashDocPoFinSource.frf',  odsSelDocPoFinSource,   grViewRashDocPoFinSource) );
  ReportsList.Add( TReportItem.Create(FR4, 'Отчет по расходу по получателям',      'RepRashPoluch',         'frRashDocPoPoluch.fr3',     odsSelDocRashPoluch,    grViewRashPoluch)         );
  ReportsList.Add( TReportItem.Create(FR4, 'Отчет по расходу (по документам)',     'RepRashDocPoDOC',       'frRashDocPoDOC.fr3',        odsSelDocRashRep,       grViewRashDocPoDOC)       );
  ReportsList.Add( TReportItem.Create(FR4, 'Отчет по расходу (по объектам учета)', 'RepRashDocPoMedic',     'frRashDocPoMedic.fr3',      odsSelDocPoMedic,       grViewRashDocPoMedic)     );
  ReportsList.Add( TReportItem.Create(FR4, 'Отчет по расходу (по учетным группам)','RepRashDocPoMedicType', 'frRashDocPoMedicType.fr3',  odsSelDocPoMedicType,   grViewRashDocPoMedicType) );
  ReportsList.Add( TReportItem.Create(FR4, 'Отчет по расходу (по источникам финансирования)','RepRashDocPoFinSource', 'frRashDocPoFinSource.fr3',  odsSelDocPoFinSource,   grViewRashDocPoFinSource) );
  ReportsList.Add( TReportItem.Create(FR4, 'Отчет по расходу (по профилям)','RepRashDocPoProfil', 'frRashDocPoProfil.fr3',  odsSelDocPoProfil,   grViewRashDocPoProfil) );
  ReportsList.Add( TReportItem.Create(FR4, 'Акт о списании материальных запасов',  'RepRashActSpisMatZap',  'frRashActSpisMatZap.fr3',   odsRashByUchgr_FincSrc, grViewRashActSpisMatZap) );
  // для нижневартовска - используется привязка видов помощи по выс. технологиям для пациентов ASU.TTABLES_LINKS ( tl.fc_table1_name = 'ASU.TKARTA' and tl.fc_table2_name = 'MED.TSPISANIEVID')
  ReportsList.Add( TReportItem.Create(FR4, 'Акты списания по ист. финансирования',  'RepRashActSpisFinSource',  'frRashDocPoMedicFinSource.fr3',   odsSelDocPoMedicFinSource, grViewRashDocPoMedicFinSource) );
  ReportsList.Add( TReportItem.Create(FR4, 'Акты списания по ист. финансирования (ДС)',  'RepRashActSpisFinSource_DS',  'frRashDocPoMedicFinSource.fr3',   odsSelDocPoMedicFinSource_DS, grViewRashDocPoMedicFinSource) );  


  AppExeName :=  ExtractFileName(Application.ExeName);
  chbRPO.Tag := DO_CHECK_OBJECT_ACCESS(os, FK_APPSOTR_ID, AppExeName+'_RPO');
  chbRPO.Visible := (chbRPO.Tag > 0);
  chbRPO.Enabled := chbRPO.Visible;
  tbuRPO.Visible := chbRPO.Visible;

  cmbReport.Properties.Items.Clear;  // выбираем только те, что видимые
  for i := 0 to ReportsList.Count - 1 do
  begin
    TReportItem(ReportsList[i]).Visible := (DO_CHECK_OBJECT_ACCESS(os, FK_APPSOTR_ID, AppExeName+'_' + TReportItem(ReportsList[i]).EngSynonim) > 0);
    if TReportItem(ReportsList[i]).Visible then
      cmbReport.Properties.Items.AddObject( TReportItem(ReportsList[i]).RusName, ReportsList[i] );
  end;

  FDate1 := StartOfTheMonth(oqInitMO.GetVariable('pSYSDATE'));
  FDate2 := EndOfTheMonth  (oqInitMO.GetVariable('pSYSDATE'));
  miPeriod.Caption := 'Период: c '+DateToStr(FDate1)+' по '+DateToStr(FDate2);

  frxReport1.AddFunction('function MONEYSTR(Summa: double): string');
//  frxReport1.AddFunction('function ROUND_TO(aFloatNum : double; aDigits : integer): double');
  frxReport1.AddFunction('function IniWriteString2(Section, Ident: string; Value: string) : integer');

  // для учета изменения учетных групп FUNC_USE_MEDUCHGRP_CH    
  if READSTRING_TSMINI('MEDICA.EXE','FUNC_USE_MEDUCHGRP_CH','0')='1' then
    UchGrIdStr := 'nvl ( TKART.UCHGRID, TMEDIC.uchgrid )'
  else
    UchGrIdStr := 'TMEDIC.uchgrid';

  odsSelDocPoMedicType.SQL.Text := StringReplace(odsSelDocPoMedicType.SQL.Text,'#uchgrid#',
      UchGrIdStr, [rfReplaceAll, rfIgnoreCase] );
  odsSelDocPoFinSource.SQL.Text := StringReplace(odsSelDocPoFinSource.SQL.Text,'#uchgrid#',
      UchGrIdStr , [rfReplaceAll, rfIgnoreCase] );
  odsRashByUchgr_FincSrc.SQL.Text := StringReplace(odsRashByUchgr_FincSrc.SQL.Text,'#uchgrid#',
      UchGrIdStr , [rfReplaceAll, rfIgnoreCase] );
  odsSelDocPoProfil.SQL.Text := StringReplace(odsSelDocPoProfil.SQL.Text,'#uchgrid#',
      UchGrIdStr, [rfReplaceAll, rfIgnoreCase] );
end;

procedure TfrmMain.acPrintExecute(Sender: TObject);
var
  p : tpoint;
  FileName : string;
  Excel : variant;
  frView : TfrView;
                     
  Params : TArrayOfParams;
  i, i2 : integer;
begin
//  lcbMO_GROUP.CloseUp(True);

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

  if (Report.EngSynonim = 'RepRashActSpisFinSource') or (Report.EngSynonim = 'RepRashActSpisFinSource_DS') or (Report.EngSynonim = 'RepRashDocPoMedicType') then
  begin
    i2 := 0;
    SetLength( Params, 1);
    Params[i2].Name := 'Председатель';
    Params[i2].Value := IniReadString(iniFileName,Report.EngSynonim, 'Predsed', '');
    Params[i2].ParamType := 1;
    inc( i2 );

    i := 3; //dmMain.ConfigParams.GetParamValue('FUNC_COUNT_SPIS_CHLEN_KOM', 3);
    SetLength( Params, Length(Params)+i);
    for i := 0 to 2 do
    begin
      Params[i2].Name := 'Член ком.'+IntToStr(i+1);
      Params[i2].Value := IniReadString(iniFileName, Report.EngSynonim, 'ChlenKom'+IntToStr(i+1), '');
      Params[i2].ParamType := 1;
      inc( i2 );
    end;

    SetLength( Params, Length(Params)+1);
    Params[i2].Name := 'Мат. отв. лицо';
    Params[i2].Value := IniReadString(iniFileName,Report.EngSynonim, 'MO', '');
    Params[i2].ParamType := 1;
    inc( i2 );

    SetLength( Params, Length(Params)+1);
    Params[i2].Name := 'Утверждаю (ФИО)';
    Params[i2].Value := IniReadString(iniFileName,Report.EngSynonim, 'UTVERJDAYU_FIO', '');
    Params[i2].ParamType := 1;
    inc( i2 );

    SetLength( Params, Length(Params)+1);
    Params[i2].Name := 'Должн. председателя';
    Params[i2].Value := IniReadString(iniFileName,Report.EngSynonim, 'DoljnChlenPredsed', '');
    Params[i2].ParamType := 0;
    inc( i2 );
    i := 3; //dmMain.ConfigParams.GetParamValue('FUNC_COUNT_SPIS_CHLEN_KOM', 3);
    SetLength( Params, Length(Params)+i);
    for i := 0 to 2 do
    begin
      Params[i2].Name := 'Должн. члена ком.'+IntToStr(i+1);
      Params[i2].Value := IniReadString(iniFileName,Report.EngSynonim, 'DoljnChlenKom'+IntToStr(i+1), '');
      Params[i2].ParamType := 0;
      inc( i2 );
    end;

    SetLength( Params, Length(Params)+1);
    Params[i2].Name := 'Должность МО';
    Params[i2].Value := IniReadString(iniFileName,Report.EngSynonim, 'DoljnMO', '');
    Params[i2].ParamType := 0;
    inc( i2 );

    SetLength( Params, Length(Params)+1);
    Params[i2].Name := 'Утверждаю (Должн.)';
    Params[i2].Value := IniReadString(iniFileName,Report.EngSynonim, 'UTVERJDAYU_DOLJN', '');
    Params[i2].ParamType := 0;
    inc( i2 );

    for i := 0 to Length(Params) - 1 do
      if i < 6 then Params[i].ParamType := 1 else Params[i].ParamType := 0;

    FZaklKom := EncodeHexToString(IniReadString(iniFileName, Report.EngSynonim, 'ZaklKom', ''));

    FSpisano := EncodeHexToString(IniReadString(iniFileName, Report.EngSynonim, 'Spisano', ''));
    FPrikaz := IniReadString(iniFileName, Report.EngSynonim, 'PrikazOt', 'от "___"  ____________  20___ г  № ___');

    if DoShowReportInputActSpis(os, Params, FZaklKom, FSpisano, FPrikaz) <> mrOk then
    begin
      FZaklKom := '';
      FSpisano := '';
      Exit;
    end;

  //      IniWriteString(iniFileName, 'KOMISSIYA', 'TEXT', EncodeStringToHex(StrList.Text));
    for i := 0 to Length(Params) - 1 do
    begin
      if Params[i].Name = 'Председатель' then FPred := Params[i].Value;

      if Params[i].Name = 'Член ком.1' then FKom1 := Params[i].Value;
      if Params[i].Name = 'Член ком.2' then FKom2 := Params[i].Value;
      if Params[i].Name = 'Член ком.3' then FKom3 := Params[i].Value;  

      if Params[i].Name = 'Мат. отв. лицо' then FMO := Params[i].Value;
      if Params[i].Name = 'Утверждаю (ФИО)' then FUTVERJDAYU_FIO := Params[i].Value;

      if Params[i].Name = 'Должн. председателя' then FDolPred := Params[i].Value;

      if Params[i].Name = 'Должн. члена ком.1' then FDolKom1 := Params[i].Value;
      if Params[i].Name = 'Должн. члена ком.2' then FDolKom2 := Params[i].Value;
      if Params[i].Name = 'Должн. члена ком.3' then FDolKom3 := Params[i].Value; 

      if Params[i].Name = 'Должность МО' then FDolMO := Params[i].Value;
      if Params[i].Name = 'Утверждаю (Должн.)' then FUTVERJDAYU_DOLJN := Params[i].Value;
    end;

    IniWriteString2(Report.EngSynonim, 'Predsed',          FPred   );

    IniWriteString2(Report.EngSynonim, 'ChlenKom1',         FKom1);
    IniWriteString2(Report.EngSynonim, 'ChlenKom2',         FKom2);
    IniWriteString2(Report.EngSynonim, 'ChlenKom3',         FKom3);

    IniWriteString2(Report.EngSynonim, 'MO',                FMO   );

    IniWriteString2(Report.EngSynonim, 'DoljnChlenPredsed', FDolPred);
    IniWriteString2(Report.EngSynonim, 'DoljnChlenKom1',   FDolKom1);
    IniWriteString2(Report.EngSynonim, 'DoljnChlenKom2',   FDolKom2);
    IniWriteString2(Report.EngSynonim, 'DoljnChlenKom3',   FDolKom3);

    IniWriteString2(Report.EngSynonim, 'DoljnMO',          FDolMO   );

    IniWriteString2(Report.EngSynonim, 'UTVERJDAYU_FIO',          FUTVERJDAYU_FIO   );
    IniWriteString2(Report.EngSynonim, 'UTVERJDAYU_DOLJN',          FUTVERJDAYU_DOLJN   );

    IniWriteString2(Report.EngSynonim, 'ZaklKom', EncodeStringToHex(FZaklKom));
    IniWriteString2(Report.EngSynonim, 'Spisano', EncodeStringToHex(FSpisano));
    IniWriteString2(Report.EngSynonim, 'PrikazOt', FPrikaz);
  end;

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
    if frReport1.LoadFromFile( TReportItem(cmbReport.ItemObject).ReportFileName ) = False then
      frReport1.Clear
    else
      OnAfterLoadReportFile();
  end;

  if Report.FR_Type = FR4 then
  begin
    if frxReport1.LoadFromFile( TReportItem(cmbReport.ItemObject).ReportFileName ) = False then
      frxReport1.Clear
    else
      OnAfterLoadReportFile();

    frxDBReport1.DataSet := Report.DataSet;

  end;

  Report.DataSet.DisableControls;

  case dmPrintSelect.PrintFlag of // флаг куда печатать
    1:
    begin
      if Report.FR_Type = FR2 then
      begin
        if (Report.EngSynonim = 'RepRashDocPoMedic') or
           (Report.EngSynonim = 'RepRashDocPoMedicType') then
        begin
          if Report.EngSynonim = 'RepRashDocPoMedic' then
            MakeExcelReportMed(cmbReport.Text+' (c '+DateToStr(FDate1)+' по '+DateToStr(FDate2)+')'+'.xls' );

          if Report.EngSynonim = 'RepRashDocPoMedicType' then
            MakeExcelReportUchGr(cmbReport.Text+' (c '+DateToStr(FDate1)+' по '+DateToStr(FDate2)+')'+'.xls', 'FC_medictype');  

          if Report.EngSynonim = 'RepRashDocPoFinSource' then
            MakeExcelReportFinSource(cmbReport.Text+' (c '+DateToStr(FDate1)+' по '+DateToStr(FDate2)+')'+'.xls', 'FC_FINSOURCE');
        end
        else
        begin
          frView := frReport1.FindObject('PageFooter1');
          if frView <> nil then
            frView.Visible := false;
          frReport1.PrepareReport;
          FileName := PrepareFilePath(cmbReport.Text+' (c '+DateToStr(FDate1)+' по '+DateToStr(FDate2)+').xls');
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
    end;
  end;

  Report.DataSet.EnableControls;
  OnAfterShowReportProc();
end;

procedure TfrmMain.aCancelExecute(Sender: TObject);
begin
  Close;
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
  end; // if ParName = 'var_receiver' then
  
  if VarName = 'VAR_MO_GROUP' then
    Value := FCurMOGroupName;

  if VarName = 'VAR_DATE1' then
    Value := DateToStr(FDate1);

  if VarName = 'VAR_DATE2' then
    Value := DateToStr(FDate2);

  if VarName = 'VAR_FIN_SOURCE' then
    Value := FFC_FIN_SOURCE;    

  if VarName = 'VAR_PROFIL' then
  begin
    if FProfilID > 0 then
      Value := 'профиль: '+FFC_PROFIL
    else
      Value := '';
  end;

  if VarName = 'VAR_UCHR_NAME' then Value :=  READSTRING_TSMINI('MANAGER_DOC', 'CLIENT_NAME', '');

  if VarName = 'VAR_GLAV_VRACH' then
  begin
    sTemp := IniReadString(iniFileName, 'MANAGER_DOC', 'GLAV_VRACH', '');
    if sTemp = '' then
      Value := READSTRING_TSMINI('MANAGER_DOC', 'GLAV_VRACH', '')
    else
      Value := sTemp;
  end;

  if VarName = 'VAR_KOMISSYA' then
  begin
//    sTemp := IniReadString(iniFileName, 'MANAGER_DOC', 'VAR_KOMISSYA', '');
//    if sTemp = '' then
      Value := READSTRING_TSMINI(ExeFileName, 'VAR_KOMISSYA', '')
//    else
//      Value := sTemp;
  end;

  if VarName = 'VAR_MO' then
    Value := oqInitMO.GetVariable('PFC_MO');

  if VarName = 'VAR_MO_DOLJNOST' then
    Value := oqInitMO.GetVariable('PFC_SPEC');

  if VarName = 'VAR_PRIKAZ' then
  begin
    sTemp := IniReadString(iniFileName, 'MANAGER_DOC', 'VAR_PRIKAZ', '');
    if sTemp = '' then
      Value := READSTRING_TSMINI(ExeFileName, 'VAR_PRIKAZ', '')
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
  
  if UpperCase(VarName) = 'PRED' then Value := FPred;
  if UpperCase(VarName) = 'KOM1' then Value := FKom1;
  if UpperCase(VarName) = 'KOM2' then Value := FKom2;
  if UpperCase(VarName) = 'KOM3' then Value := FKom3;
  if UpperCase(VarName) = 'MO'   then Value := FMO;
  if UpperCase(VarName) = 'DOLPRED' then Value := FDolPred;
  if UpperCase(VarName) = 'DOLKOM1' then Value := FDolKom1;
  if UpperCase(VarName) = 'DOLKOM2' then Value := FDolKom2;
  if UpperCase(VarName) = 'DOLKOM3' then Value := FDolKom3;
  if UpperCase(VarName) = 'DOLMO'   then Value := FDolMO;
  if UpperCase(VarName) = 'PRIKAZ' then Value  := FPrikaz;   
  if UpperCase(VarName) = 'UTVERJDAYU_FIO' then Value  := FUTVERJDAYU_FIO;
  if UpperCase(VarName) = 'UTVERJDAYU_DOLJN' then Value  := FUTVERJDAYU_DOLJN;
  if UpperCase(VarName) = 'GETZAKLKOM' then Value := FZaklKom;

  if VarName = 'PRED_KOM' then
  begin
    Value := IniReadString(iniFileName, 'MANAGER_DOC', 'PRED_KOM', '');
  end;

  if VarName = 'CH_KOM1' then
  begin
    Value := IniReadString(iniFileName, 'MANAGER_DOC', 'CH_KOM1', '');
  end;

  if VarName = 'CH_KOM2' then
  begin
    Value := IniReadString(iniFileName, 'MANAGER_DOC', 'CH_KOM2', '');
  end;

  if VarName = 'CH_KOM3' then
  begin
    Value := IniReadString(iniFileName, 'MANAGER_DOC', 'CH_KOM3', '');
  end;
end;

function TfrmMain.frxReport1UserFunction(const MethodName: string;
  var Params: Variant): Variant;
begin
	if UpperCase(MethodName) = 'MONEYSTR' then
	begin
		Result := MoneyToString(Params[0], True);
  end;

  if UpperCase(MethodName) = 'INIWRITESTRING2' then
  begin
    Result := IniWriteString2( Params[0], Params[1], Params[2] );
  end;
end;

procedure TfrmMain.odsFinSourceAfterOpen(DataSet: TDataSet);
var
  mi : TMenuItem;
begin
  odsFinSource.First;
  while not odsFinSource.Eof do
  begin
    mi := TMenuItem.Create(pmFinSource);
    mi.Caption   := odsFinSource.FieldByName('FC_NAME').AsString;
    mi.Tag       := odsFinSource.FieldByName('FK_ID').AsInteger;
    mi.AutoCheck := True;
    mi.Checked   := False;
    mi.RadioItem := True;
    mi.OnClick   := miAllFinSourceClick;
    pmFinSource.Items.Add(mi);
    odsFinSource.Next;
  end;
end;

procedure TfrmMain.odsGroupMoAfterOpen(DataSet: TDataSet);
//var
//  mi : TMenuItem;
begin
//  miMO_GROUP.Clear;
//  DataSet.First;
//  while not DataSet.Eof do
//  begin
//    mi := TMenuItem.Create(miMO_GROUP);
//    mi.Caption := odsGroupMoFC_GROUP.AsString;
//    mi.Tag := odsGroupMoGROUPID.AsInteger;
//    mi.Checked := False;
//    mi.GroupIndex := 1;
//    mi.AutoCheck := True;
//    mi.RadioItem := True;
//    mi.OnClick := miMO_GROUPClick;
//    miMO_GROUP.Add(mi);
//    DataSet.Next;
//  end;
//  CurMOGroup := StrToInt(IniReadString(Application.ExeName+'.ini','Params', 'LastMOGroupID', '-1'));
//  lcbMO_GROUP.KeyValue := StrToInt(IniReadString(Application.ExeName+'.ini','Params', 'LastMOGroupID', '-1'));
//  lcbMO_GROUP.CloseUp(True);
end;

procedure TfrmMain.odsProfilAfterOpen(DataSet: TDataSet);
var
  mi : TMenuItem;
begin
  odsProfil.First;
  while not odsProfil.Eof do
  begin
    mi := TMenuItem.Create(pmProfil);
    mi.Caption   := odsProfil.FieldByName('FC_NAME').AsString;
    mi.Tag       := odsProfil.FieldByName('FK_ID').AsInteger;
    mi.AutoCheck := True;
    mi.Checked   := False;
    mi.RadioItem := True;
    mi.OnClick   := miAllProfilClick;
    pmProfil.Items.Add(mi);
    odsProfil.Next;
  end;
end;

procedure TfrmMain.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  IniWriteString(Application.ExeName+'.ini','Params', 'LastMOGroupID', IntToStr(lcbMO_GROUP.KeyValue));
  IniWriteString(iniFileName,'Params', 'LastMOGroupID', IntToStr(CurMOGroup));
  LoadKeyboardLayout(FLang, KLF_ACTIVATE);
  Action := caFree;
end;

procedure TfrmMain.frRashDocITOGGetValue(const ParName: String;
  var ParValue: Variant);
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
end;

function TfrmMain.GetEndGroupRow(AText, aSumm: String): String;
begin
  Result :=
  '<tr height=20 style=''mso-height-source:userset;height:15.2pt''>'#13#10+
//  '  <td colspan=8 height=20 class=xl5325472 width=880 style=''border-right:.5pt solid black; height:15.2pt;width:660pt''>'+AText+'</td>'#13#10+
//  '  <td class=xl6225472 width=96 style=''border-top:none;border-left:none; width:72pt''><span style=''mso-spacerun:yes''>  </span>'+aSumm+'</td>'#13#10+
  '  <td colspan=7 height=20 class=xl5325472 style=''border-right:.5pt solid black; height:15.2pt''>'+AText+'</td>'#13#10+
  '  <td colspan=2 class=xl6225472 style=''border-top:none;border-left:none''><span style=''mso-spacerun:yes''>  </span>'+aSumm+'</td>'#13#10+
  '</tr>'#13#10;
end;

function TfrmMain.GetGroupRow(AText: String): String;
begin
  Result :=
  '<tr height=20 style=''mso-height-source:userset;height:15.2pt''>'#13#10+
  '  <td height=20 class=xl4825472 width=31 style=''height:15.2pt;border-top:none;width:23pt''>&nbsp;</td>'#13#10+
  '  <td colspan=8 class=xl4925472 width=945 style=''border-right:.5pt solid black;border-left:none;width:709pt''><span style=''mso-spacerun:yes''> </span>'+AText+'</td>'#13#10+
  '</tr>'#13#10;
end;

function TfrmMain.GetRow(aNum, aName, aEdIzm, aDate, aDoc, aPoluch, aKol, aPrice, aSumm: String): String;
begin
  Result :=
  '<tr height=28 style=''mso-height-source:userset;height:21.4pt''>'#13#10+
  '  <td height=28 class=xl5225472 width=31 style=''height:21.4pt;border-top:none; width:23pt''>'+aNum+'</td>'#13#10+
  '  <td class=xl3925472 width=240 style=''border-top:none;border-left:none; width:180pt''>'+aName+'</td>'#13#10+
  '  <td class=xl5225472 width=61 style=''border-top:none;border-left:none; width:46pt''>'+aEdIzm+'</td>'#13#10+
  '  <td class=xl3825472 width=79 style=''border-top:none;border-left:none; width:59pt''>'+aDate+'</td>'#13#10+
  '  <td class=xl5925472 width=161 style=''border-top:none;border-left:none; width:121pt''>'+aDoc+'</td>'#13#10+
  '  <td class=xl3825472 width=163 style=''border-top:none;width:122pt''>'+aPoluch+'</td>'#13#10+
  '  <td class=xl6025472 width=73 style=''border-top:none;border-left:none; width:55pt; text-align:right''>'+aKol+'</td>'#13#10+
  '  <td class=xl5225472 width=72 style=''border-top:none;width:54pt; text-align:right''>'+aPrice+'</td>'#13#10+
  '  <td class=xl5225472 width=96 style=''border-top:none;border-left:none; width:72pt; text-align:right''>'+aSumm+'</td>'#13#10+
  '</tr>'#13#10;
end;

procedure TfrmMain.MakeExcelReportUchGr(aFileName, aGroupFieldName: string);
var
  S, sGroup: String;
  N: Integer;
  sFileName1, sFileName2: String;
  Excel: Variant;
  FN_SUMM, FN_GROUP_SUMM : Double;
  RowCount : integer;
begin
  Screen.Cursor:=crHourGlass;

  S:='';
  sGroup:='';
  N:=0;

  with odsSelDocPoMedicType do
  begin
//    if Active then Close;
//    Open;
    First;
    RowCount := RecordCount;
    FN_SUMM := 0;
    FN_GROUP_SUMM := 0;
    sGroup:=FieldByName(aGroupFieldName).AsString;
    //S:=S+#13#10+GetGroupRow(sGroup);
    S:=S+#13#10+
              '<tr height=20 style=''mso-height-source:userset;height:15.2pt''>'#13#10+
              '  <td height=20 class=xl4825472 width=31 style=''height:15.2pt;border-top:none;width:23pt''>&nbsp;</td>'#13#10+
              '  <td colspan=9 class=xl4925472 width=945 style=''border-right:.5pt solid black;border-left:none;width:709pt''><span style=''mso-spacerun:yes''> </span>'+sGroup+'</td>'#13#10+
              '</tr>'#13#10;
    while not Eof do
    begin
      if FieldByName(aGroupFieldName).AsString<>sGroup then
      begin
        //S:=S+#13#10+GetEndGroupRow( 'Итого по группе учетности: "'+sGroup+'"', FloatToStrF(FN_GROUP_SUMM,ffNumber, 15, 2));
        S:=S+#13#10+
                  '<tr height=20 style=''mso-height-source:userset;height:15.2pt''>'#13#10+
                  '  <td colspan=8 height=20 class=xl5325472 style=''border-right:.5pt solid black; height:15.2pt''>'+'Итого по группе учетности: "'+sGroup+'"'+'</td>'#13#10+
                  '  <td colspan=2 class=xl6225472 style=''border-top:none;border-left:none''><span style=''mso-spacerun:yes''>  </span>'+FloatToStrF(FN_GROUP_SUMM,ffNumber, 15, 2)+'</td>'#13#10+
                  '</tr>'#13#10;
        FN_GROUP_SUMM := 0;
        sGroup := FieldByName(aGroupFieldName).AsString;
        Inc(RowCount,2); // не забудь приплюсовать футер группы 
        S:=S+#13#10+GetGroupRow(sGroup);
        N:=0;
      end;

      Inc(N);  // GetRow(aNum, aName, aEdIzm, aDate, aDoc, aPoluch, aKol, aPrice, aSumm: String): String;
      {S:=S+#13#10+GetRow(IntToStr(N),
                         FieldByName('NAMEKART').AsString,
                         FieldByName('FC_EDIZM').AsString,
                         FieldByName('DATA').AsString,
                         FieldByName('FC_DOC').AsString,
                         FieldByName('FC_MO_GR_TO').AsString,
                         FieldByName('FC_KOL').AsString,
                         FloatToStrF(FieldByName('FN_PRICE_DETAIL').AsFloat, ffNumber, 15, 2),
                         FloatToStrF(FieldByName('FN_SUMM').AsFloat, ffNumber, 15, 2));}
      S:=S+#13#10+
                    '<tr height=28 style=''mso-height-source:userset;height:21.4pt''>'#13#10+
                    '  <td height=28 class=xl5225472 width=31 style=''height:21.4pt;border-top:none; width:23pt''>'+IntToStr(N)+'</td>'#13#10+
                    '  <td class=xl3925472 width=220 style=''border-top:none;border-left:none; width:150pt''>'+FieldByName('NAMEKART').AsString+'</td>'#13#10+
                    '  <td class=xl5225472 width=40 style=''border-top:none;border-left:none; width:40pt''>'+FieldByName('FC_EDIZM').AsString+'</td>'#13#10+
                    '  <td class=xl3825472 width=69 style=''border-top:none;border-left:none; width:59pt''>'+FieldByName('DATA').AsString+'</td>'#13#10+
                    '  <td class=xl5925472 width=150 style=''border-top:none;border-left:none; width:100pt''>'+FieldByName('FC_DOC').AsString+'</td>'#13#10+
                    '  <td class=xl3825472 width=150 style=''border-top:none;width:100pt''>'+FieldByName('FC_MO_GR_TO').AsString+'</td>'#13#10+
                    '  <td class=xl3825472 width=169 style=''border-top:none;width:59pt''>'+FieldByName('FC_FINSOURCE').AsString+'</td>'#13#10+
                    '  <td class=xl6025472 width=50 style=''border-top:none;border-left:none; width:55pt; text-align:right''>'+FieldByName('FC_KOL').AsString+'</td>'#13#10+
                    '  <td class=xl5225472 width=72 style=''border-top:none;width:54pt; text-align:right''>'+FloatToStrF(FieldByName('FN_PRICE_DETAIL').AsFloat, ffNumber, 15, 2)+'</td>'#13#10+
                    '  <td class=xl5225472 width=96 style=''border-top:none;border-left:none; width:72pt; text-align:right''>'+FloatToStrF(FieldByName('FN_SUMM').AsFloat, ffNumber, 15, 2)+'</td>'#13#10+
                    '</tr>'#13#10;
      FN_SUMM := FN_SUMM + FieldByName('FN_SUMM').AsFloat;
      FN_GROUP_SUMM := FN_GROUP_SUMM + FieldByName('FN_SUMM').AsFloat;
      Next;
    end; // while not Eof do
    if RecordCount > 0 then
      //S:=S+#13#10+GetEndGroupRow( 'Итого по группе учетности: "'+sGroup+'"', FloatToStrF(FN_GROUP_SUMM, ffNumber, 15, 2) );
       S:=S+#13#10+
                  '<tr height=20 style=''mso-height-source:userset;height:15.2pt''>'#13#10+
                  '  <td colspan=8 height=20 class=xl5325472 style=''border-right:.5pt solid black; height:15.2pt''>'+'Итого по группе учетности: "'+sGroup+'"'+'</td>'#13#10+
                  '  <td colspan=2 class=xl6225472 style=''border-top:none;border-left:none''><span style=''mso-spacerun:yes''>  </span>'+FloatToStrF(FN_GROUP_SUMM,ffNumber, 15, 2)+'</td>'#13#10+
                  '</tr>'#13#10;
    //Close;
  end; // with odsRep do

  sFileName1 := ChangeFileExt(fdmPrintSelect.PrepareFilePath(aFileName), 'htm');
  sFileName2 := ChangeFileExt(sFileName1,'.xls');
  SaveResToFile( 'Rash_UchGr', 'htm', sFileName1);

  with TStringList.Create do
  begin
    LoadFromFile(sFileName1);
    Text:=StringReplace(Text, '::REPLACEHERE::', S,                                                  [rfIgnoreCase]);
    Text:=StringReplace(Text, '::FN_SUMM::',     FloatToStrF(FN_SUMM, ffCurrency, 15, 2),            [rfIgnoreCase]);
    Text:=StringReplace(Text, '::Otdelenie::',   odsGroupMo.FieldByName('FC_GROUP').AsString,        [rfIgnoreCase]);
    Text:=StringReplace(Text, '::UCHREJDENIE::', GetTSMINIValue( os, 'MANAGER_DOC', 'CLIENT_NAME' ), [rfIgnoreCase]);
    Text:=StringReplace(Text, '::DATE1::',       DateTimeToStr(FDate1),                         [rfIgnoreCase]);
    Text:=StringReplace(Text, '::DATE2::',       DateTimeToStr(FDate2),                         [rfIgnoreCase]);    

    try
      SaveToFile(sFileName2);
    except
    end;
    Free;
  end;

  Excel:=CreateOleObject('Excel.Application');
  Excel.Workbooks.Open(sFileName2);
  Excel.ActiveSheet.PageSetup.Orientation:=xlLandscape;
  Excel.Rows['13:'+IntToStr(RowCount+13)].EntireRow.AutoFit;
  Excel.ActiveSheet.PageSetup.PrintTitleRows:='$13:$13';
  Excel.ActiveSheet.PageSetup.Zoom := 84;
  Excel.Visible:=True;
  DeleteFile(sFileName1);

  Screen.Cursor:=crDefault;
end;    

procedure TfrmMain.MakeExcelReportFinSource(aFileName, aGroupFieldName: string);
var
  S, sGroup: String;
  N: Integer;
  sFileName1, sFileName2: String;
  Excel: Variant;
  FN_SUMM, FN_GROUP_SUMM : Double;
  RowCount : integer;
begin
  Screen.Cursor:=crHourGlass;

  S:='';
  sGroup:='';
  N:=0;

  with odsSelDocPoMedicType do
  begin
//    if Active then Close;
//    Open;
    First;
    RowCount := RecordCount;
    FN_SUMM := 0;
    FN_GROUP_SUMM := 0;
    sGroup:=FieldByName(aGroupFieldName).AsString;
    S:=S+#13#10+GetGroupRow(sGroup);
    while not Eof do
    begin
      if FieldByName(aGroupFieldName).AsString<>sGroup then
      begin
        S:=S+#13#10+GetEndGroupRow( 'Итого по источнику финансирования: "'+sGroup+'"', FloatToStrF(FN_GROUP_SUMM,ffNumber, 15, 2));
        FN_GROUP_SUMM := 0;
        sGroup := FieldByName(aGroupFieldName).AsString;
        Inc(RowCount,2); // не забудь приплюсовать футер группы 
        S:=S+#13#10+GetGroupRow(sGroup);
        N:=0;
      end;

      Inc(N);  // GetRow(aNum, aName, aEdIzm, aDate, aDoc, aPoluch, aKol, aPrice, aSumm: String): String;
      S:=S+#13#10+GetRow(IntToStr(N),
                         FieldByName('NAMEKART').AsString,
                         FieldByName('FC_EDIZM').AsString,
                         FieldByName('DATA').AsString,
                         FieldByName('FC_DOC').AsString,
                         FieldByName('FC_MO_GR_TO').AsString,
                         FieldByName('FC_KOL').AsString,
                         FloatToStrF(FieldByName('FN_PRICE_DETAIL').AsFloat, ffNumber, 15, 2),
                         FloatToStrF(FieldByName('FN_SUMM').AsFloat, ffNumber, 15, 2));
      FN_SUMM := FN_SUMM + FieldByName('FN_SUMM').AsFloat;
      FN_GROUP_SUMM := FN_GROUP_SUMM + FieldByName('FN_SUMM').AsFloat;
      Next;
    end; // while not Eof do
    if RecordCount > 0 then S:=S+#13#10+GetEndGroupRow( 'Итого по источнику финансирования: "'+sGroup+'"', FloatToStrF(FN_GROUP_SUMM, ffNumber, 15, 2) );
    //Close;
  end; // with odsRep do

  sFileName1 := ChangeFileExt(fdmPrintSelect.PrepareFilePath(aFileName), 'htm');
  sFileName2 := ChangeFileExt(sFileName1,'.xls');
  SaveResToFile( 'Rash_UchGr', 'htm', sFileName1);

  with TStringList.Create do
  begin
    LoadFromFile(sFileName1);
    Text:=StringReplace(Text, '::REPLACEHERE::', S,                                                  [rfIgnoreCase]);
    Text:=StringReplace(Text, '::FN_SUMM::',     FloatToStrF(FN_SUMM, ffCurrency, 15, 2),            [rfIgnoreCase]);
    Text:=StringReplace(Text, '::Otdelenie::',   odsGroupMo.FieldByName('FC_GROUP').AsString,        [rfIgnoreCase]);
    Text:=StringReplace(Text, '::UCHREJDENIE::', GetTSMINIValue( os, 'MANAGER_DOC', 'CLIENT_NAME' ), [rfIgnoreCase]);
    Text:=StringReplace(Text, '::DATE1::',       DateTimeToStr(FDate1),                         [rfIgnoreCase]);
    Text:=StringReplace(Text, '::DATE2::',       DateTimeToStr(FDate2),                         [rfIgnoreCase]);    

    try
      SaveToFile(sFileName2);
    except
    end;
    Free;
  end;

  Excel:=CreateOleObject('Excel.Application');
  Excel.Workbooks.Open(sFileName2);
  Excel.ActiveSheet.PageSetup.Orientation:=xlLandscape;
  Excel.Rows['13:'+IntToStr(RowCount+13)].EntireRow.AutoFit;
  Excel.ActiveSheet.PageSetup.PrintTitleRows:='$12:$12';
  Excel.ActiveSheet.PageSetup.Zoom := 94;  
  Excel.Visible:=True;
  DeleteFile(sFileName1);

  Screen.Cursor:=crDefault;
end;

procedure TfrmMain.MakeExcelReportMed(aFileName: string);
 function GetGroupRow(AText: String): String;
 begin
  Result:=
  '<tr height=17 style=''height:12.75pt''>'+
  ' <td height=17 class=xl157869 style=''height:12.75pt''></td>'+
  ' <td class=xl307869 style=''border-top:none''>&nbsp;</td>'+
  ' <td colspan=10 class=xl347869 style=''border-right:.5pt solid black; border-left:none''>'+AText+' </td>'+
  '</tr>';
 end;

 function GetRow(A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11: String): String;
 begin
  Result:=
  '<tr height=17 style=''height:12.75pt''>'+
  ' <td height=17 class=xl157869 style=''height:12.75pt''></td>'+
  ' <td class=xl317869 style=''border-top:none''>'+A1+' </td>'+
  ' <td class=xl317869 style=''border-top:none;border-left:none''>'+A2+' </td>'+
  ' <td class=xl337869 width=241 style=''border-top:none;border-left:none; width:181pt''>'+A3+' </td>'+
  ' <td class=xl317869 style=''border-top:none;border-left:none''>'+A4+' </td>'+
  ' <td class=xl337869 width=271 style=''border-top:none;border-left:none; width:203pt''>'+A5+' </td>'+
  ' <td class=xl317869 style=''border-top:none;border-left:none''>'+A6+' </td>'+
  ' <td class=xl317869 style=''border-top:none;border-left:none''>'+A7+' </td>'+
  ' <td class=xl317869 style=''border-top:none;border-left:none;text-align:right;''>'+A8+' </td>'+
  ' <td class=xl317869 style=''border-top:none;border-left:none;text-align:right;''>'+A9+' </td>'+
  ' <td class=xl317869 style=''border-top:none;border-left:none;text-align:right;''>'+A10+' </td>'+
  ' <td class=xl327869 style=''border-top:none;border-left:none;text-align:right;''>'+A11+' </td>'+
  '</tr>';
 end;

 function GetSum(A1, A2: String): String;
 begin
  Result:=
  '<tr height=17 style=''height:12.75pt''>'+
  ' <td height=17 class=xl157869 style=''height:12.75pt''></td>'+
  ' <td colspan=9 class=xl377869 style=''border-right:.5pt solid black''>Итого по'+
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
 nCount:=0;


 with odsSelDocPoMedic do begin
//  if Active then Close;
//  Open;
  First;
  while not Eof do begin
   if FieldByName('FC_MO_GR_TO').AsString<>sGroup then begin
    if S<>'' then begin
     S:=S+#13#10+GetSum(sGroup, CurrToStrF(nS, ffNumber, 2));
     nS:=0;
     Inc(nCount);
    end;

    sGroup:=FieldByName('FC_MO_GR_TO').AsString;
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
                       FieldByName('FC_ED_IZM').AsString,
                       FieldByName('fc_serial').AsString,
                       FieldByName('FC_kol').AsString,
                       CurrToStrF(FieldByName('fn_price_detail').AsFloat, ffNumber, 2),
                       CurrToStrF(FieldByName('fn_summ').AsFloat, ffNumber, 2),
                       CurrToStrF(FieldByName('fn_price_master').AsFloat, ffNumber, 2))
   else
    S:=S+#13#10+GetRow('',
                       '',
                       '',
                       IntToStr(nSub),
                       FieldByName('namekart').AsString,
                       FieldByName('FC_ED_IZM').AsString,
                       FieldByName('fc_serial').AsString,
                       FieldByName('FC_kol').AsString,
                       CurrToStrF(FieldByName('fn_price_detail').AsFloat, ffNumber, 2),
                       CurrToStrF(FieldByName('fn_summ').AsFloat, ffNumber, 2),
                       '');
   Inc(nCount);

   nS:=nS+FieldByName('fn_summ').AsFloat;
   nI:=nI+FieldByName('fn_summ').AsFloat;

   Next;
  end;
  //Close;
  S:=S+#13#10+GetSum(sGroup, CurrToStrF(nS, ffNumber, 2));
  Inc(nCount);
 end;

  sFileName1 := ChangeFileExt(fdmPrintSelect.PrepareFilePath(aFileName), '.htm');
  sFileName2 := ChangeFileExt(sFileName1,'.xls');
  SaveResToFile( 'Rash_Med', 'htm', sFileName1);

  with TStringList.Create do
  begin
    LoadFromFile(sFileName1);
    Text:=StringReplace(Text, '::REPLACEHERE::', S,                                                  [rfIgnoreCase]);
    Text:=StringReplace(Text, '::FN_SUMM::',     FloatToStrF(nI, ffCurrency, 15, 2),                 [rfIgnoreCase]);
    Text:=StringReplace(Text, '::Otdelenie::',   odsGroupMo.FieldByName('FC_GROUP').AsString,        [rfIgnoreCase]);
    Text:=StringReplace(Text, '::UCHREJDENIE::', GetTSMINIValue( os, 'MANAGER_DOC', 'CLIENT_NAME' ), [rfIgnoreCase]);
    Text:=StringReplace(Text, '::DATE1::',       DateTimeToStr(FDate1),                         [rfIgnoreCase]);
    Text:=StringReplace(Text, '::DATE2::',       DateTimeToStr(FDate2),                         [rfIgnoreCase]);

    try
      SaveToFile(sFileName2);
    except
    end;
    Free;
  end;

 Excel:=CreateOleObject('Excel.Application');
 Excel.Workbooks.Open(sFileName2);

 Excel.Rows['11:'+IntToStr(11+nCount)].EntireRow.AutoFit;
 Excel.ActiveSheet.PageSetup.PrintTitleRows:='$10:$11';
 Excel.ActiveSheet.PageSetup.Orientation:=xlLandscape;
 Excel.ActiveSheet.PageSetup.LeftMargin := 50;
 Excel.ActiveSheet.PageSetup.RightMargin := 27;
 Excel.ActiveSheet.PageSetup.TopMargin := 27;
 Excel.ActiveSheet.PageSetup.BottomMargin := 27;
 Excel.ActiveSheet.PageSetup.Zoom := 85;

  // выставляем перенос слов для столбца серийный номер
 Excel.Columns['H:H'].Select;
 Excel.Selection.WrapText := True;

 Excel.Range['C9'].Select;
 Excel.Selection.ColumnWidth := 9.7;

 Excel.Range['A1:A1'].Select;
 Excel.Visible:=True;
 Screen.Cursor:=crDefault;
end;

procedure TfrmMain.lcbMO_GROUPCloseUp(Sender: TObject);
begin
//  lcbMO_GROUP.Hint := lcbMO_GROUP.Text;
//  cmbReportPropertiesChange(nil);
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

procedure TfrmMain.miAllFinSourceClick(Sender: TObject);
begin
  pmFinSource.Tag := TMenuItem(Sender).Tag;
  FFC_FIN_SOURCE := TMenuItem(Sender).Caption;
  FFinSourceID := TMenuItem(Sender).Tag;
  Report.DataSet.Close;
  Report.DataSet.SetVariable('FK_FINSOURCE_ID',   FFinSourceID);
  Report.DataSet.Open;
//  cmbReportPropertiesChange(nil);
end;

procedure TfrmMain.miAllProfilClick(Sender: TObject);
begin
  pmProfil.Tag := TMenuItem(Sender).Tag;
  FFC_PROFIL := TMenuItem(Sender).Caption;
  FProfilID := TMenuItem(Sender).Tag;
  Report.DataSet.Close;
  Report.DataSet.SetVariable('FK_PROFIL_ID',   FProfilID);
  Report.DataSet.Open;
end;

procedure TfrmMain.miAllUchGrClick(Sender: TObject);
begin
  pmUchGr.Tag := TMenuItem(Sender).Tag;
  FUchGrID := TMenuItem(Sender).Tag;
  cmbReportPropertiesChange(nil);
end;

procedure TfrmMain.OnAfterShowReportProc;
begin
  dmPrintSelect.PrintFlag := 0;
end;

procedure TfrmMain.OnBeforeOpenReportProc;
begin
  if Report.EngSynonim = 'RepRashPoluch' then
  begin
    odsNacenkaUcenka.Close;
    odsNacenkaUcenka.SetVariable('IS_RPO', IS_RPO);
    if IS_RPO = 1 then
    begin
//      odsNacenkaUcenka.SetVariable('MOGROUPID', CurMOGroup);
      odsNacenkaUcenka.SetVariable('date1', FDate1);
      odsNacenkaUcenka.SetVariable('date2', FDate2);
      odsNacenkaUcenka.Open;
    end;
  end;
end;

procedure TfrmMain.OnAfterLoadReportFile;
begin
 
end;

procedure TfrmMain.OnBeforeSelectReporProc;
begin
  FUchGrID := -1;
  FFinSourceID := -1;
  FFC_FIN_SOURCE := miAllFinSource.Caption;
  FProfilID := -1;
  FFC_PROFIL := miAllProfil.Caption;

  if Report.EngSynonim = 'RepRashPoluch' then
  begin
    odsSelDocRashPoluch.Close;
    odsSelDocRashPoluch.SetVariable('MO_GROUP',CurMOGroup);
    odsSelDocRashPoluch.SetVariable('adata1', FDate1);
    odsSelDocRashPoluch.SetVariable('adata2', FDate2);
    odsSelDocRashPoluch.SetVariable('IS_RPO', IS_RPO);
    odsSelDocRashPoluch.Open;
  end;

  if Report.EngSynonim = 'RepRashDocPoDOC' then
  begin
    odsSelDocRashRep.SetVariable('MO_GROUP',  CurMOGroup);
    odsSelDocRashRep.SetVariable('adata1',    FDate1);
    odsSelDocRashRep.SetVariable('adata2',    FDate2);
    odsSelDocRashRep.SetVariable('IS_RPO',    IS_RPO);
  end;

  if Report.EngSynonim = 'RepRashDocPoMedic' then
  begin
    odsSelDocPoMedic.SetVariable('MO_GROUP', CurMOGroup);
    odsSelDocPoMedic.SetVariable('ADATA1',   FDate1);
    odsSelDocPoMedic.SetVariable('ADATA2',   FDate2);
    odsSelDocPoMedic.SetVariable('IS_RPO',   IS_RPO);
  end;

  tbuUchGrSelect.Visible := (Report.EngSynonim = 'RepRashDocPoMedicType') or (Report.EngSynonim = 'RepRashDocPoProfil');
  tbuUchGrSep.Visible := tbuUchGrSelect.Visible;
  tbuUchGrSelect.Enabled := tbuUchGrSelect.Visible;

  tbuProfil.Visible := (Report.EngSynonim = 'RepRashDocPoMedicType') or (Report.EngSynonim = 'RepRashDocPoProfil');
  tbuProfilSep.Visible := tbuProfil.Visible;
  tbuProfil.Enabled := tbuProfil.Visible;
  if Report.EngSynonim = 'RepRashDocPoMedicType' then
  begin
    FUchGrID := pmUchGr.Tag;  
    FProfilID := pmProfil.Tag;
    odsSelDocPoMedicType.SetVariable('MO_GROUP', CurMOGroup);
    odsSelDocPoMedicType.SetVariable('ADATA1',   FDate1);
    odsSelDocPoMedicType.SetVariable('ADATA2',   FDate2);
    odsSelDocPoMedicType.SetVariable('PUCHGR',   FUchGrID);  
    odsSelDocPoMedicType.SetVariable('FK_PROFIL_ID',   FProfilID);
    odsSelDocPoMedicType.SetVariable('IS_RPO',   IS_RPO);
  end;     

  if Report.EngSynonim = 'RepRashDocPoProfil' then
  begin
    FUchGrID := pmUchGr.Tag;  
    FProfilID := pmProfil.Tag;
    odsSelDocPoProfil.SetVariable('MO_GROUP', CurMOGroup);
    odsSelDocPoProfil.SetVariable('ADATA1',   FDate1);
    odsSelDocPoProfil.SetVariable('ADATA2',   FDate2);
    odsSelDocPoProfil.SetVariable('PUCHGR',   FUchGrID);
    odsSelDocPoProfil.SetVariable('FK_PROFIL_ID',   FProfilID);
    odsSelDocPoProfil.SetVariable('IS_RPO',   IS_RPO);
  end;

  if Report.EngSynonim = 'RepRashDocPoFinSource' then
  begin
    FUchGrID := pmUchGr.Tag;
    odsSelDocPoFinSource.SetVariable('MO_GROUP', CurMOGroup);
    odsSelDocPoFinSource.SetVariable('ADATA1',   FDate1);
    odsSelDocPoFinSource.SetVariable('ADATA2',   FDate2);
    odsSelDocPoFinSource.SetVariable('IS_RPO',   IS_RPO);
    odsSelDocPoFinSource.SetVariable('FK_FINSOURCE_ID',   FFinSourceID);
  end;

  tbuFinSource.Visible := (Report.EngSynonim = 'RepRashActSpisMatZap') or (Report.EngSynonim = 'RepRashDocPoFinSource');
  tbuFinSourceSep.Visible := tbuFinSource.Visible;
  tbuFinSource.Enabled := tbuFinSource.Visible;
  if Report.EngSynonim = 'RepRashActSpisMatZap' then
  begin
//    FFinSourceID := pmFinSource.Tag;
//:MO_GROUP, :FK_FINSOURCE_ID, :ADATA1, :ADATA2
    odsRashByUchgr_FincSrc.SetVariable('MO_GROUP', CurMOGroup);
    odsRashByUchgr_FincSrc.SetVariable('ADATA1',   FDate1);
    odsRashByUchgr_FincSrc.SetVariable('ADATA2',   FDate2);
    odsRashByUchgr_FincSrc.SetVariable('FK_FINSOURCE_ID',   FFinSourceID);

    if (READSTRING_TSMINI(ExeFileName, 'USE_DATE_SPIS_INSTEAD_OF_DATE', '0') = '1') then
      odsRashByUchgr_FincSrc.SetVariable('USE_DATE_SPIS_INSTEAD_OF_DATE',   'nvl(TDPC.FD_DATE_SPIS,TDOCS.FD_DATA)')
    else
      odsRashByUchgr_FincSrc.SetVariable('USE_DATE_SPIS_INSTEAD_OF_DATE',   'TDOCS.FD_DATA');
  end;

  if Report.EngSynonim = 'RepRashActSpisFinSource' then
  begin
    odsSelDocPoMedicFinSource.SetVariable('MO_GROUP', CurMOGroup);
    odsSelDocPoMedicFinSource.SetVariable('ADATA1',   FDate1);
    odsSelDocPoMedicFinSource.SetVariable('ADATA2',   FDate2);
  end;

  if Report.EngSynonim = 'RepRashActSpisFinSource_DS' then
  begin
    odsSelDocPoMedicFinSource_DS.SetVariable('MO_GROUP', CurMOGroup);
    odsSelDocPoMedicFinSource_DS.SetVariable('ADATA1',   FDate1);
    odsSelDocPoMedicFinSource_DS.SetVariable('ADATA2',   FDate2);
  end;
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
  acGridToExcel.Enabled := (cmbReport.ItemIndex > -1);
  acPrint.Enabled := (cmbReport.ItemIndex > -1);
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
     (Report.EngSynonim = 'RepPrihDocPoFinSource')  then
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

procedure TfrmMain.chbRPOClick(Sender: TObject);
begin
  if chbRPO.Checked then
    IS_RPO := 1
  else
    IS_RPO := 0;
  cmbReportPropertiesChange(nil);
end;

procedure TfrmMain.tbuFinSourceClick(Sender: TObject);
var
  p : TPoint;
begin
  p.X := 0;
  p.Y := tbuFinSource.Height;
  p := tbuFinSource.ClientToScreen(p);
  TToolButton(Sender).DropdownMenu.Popup(p.x, p.Y);
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

{ TReportItem }

constructor TReportItem.Create(aFR_type, aRusName, aEngSynonim,
  aReportFileName: string; aDataSet: TOracleDataset;
  acxGridDBTableView: TcxGridTableView; aVisible: boolean);
begin
  FR_Type           := aFR_Type;  
  RusName           := aRusName;
  EngSynonim        := aEngSynonim;
  ReportFileName    := aReportFileName;
  DataSet           := aDataSet;
  cxGridDBTableView := acxGridDBTableView;
  Visible           := aVisible;
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


procedure TfrmMain.miPeriodClick(Sender: TObject);
begin
  ShowPeriod(Mouse.CursorPos.X, Mouse.CursorPos.Y, oqInitMO.GetVariable('pSYSDATE'),  FDate1, FDate2 );
  miPeriod.Caption := 'Период: c '+DateToStr(FDate1)+' по '+DateToStr(FDate2);
  cmbReportPropertiesChange(nil);
end;

procedure TfrmMain.SetMOGroup(aMOGroup: integer);
begin
  if odsGroupMo.Locate('GROUPID', aMOGroup, []) then
  begin
    FCurMOGroup := aMOGroup;
    FCurMOGroupName := odsGroupMo.FieldByName('FC_GROUP').AsString;
    miMO_GROUP.Caption := 'Группа мат. отв.: '+FCurMOGroupName;
  end;
end;

procedure TfrmMain.miMO_GROUPClick(Sender: TObject);
begin
//  CurMOGroup := TMenuItem(Sender).Tag;
  if ShowMoGROUP(Mouse.CursorPos.X, Mouse.CursorPos.Y, odsGroupMo, FCurMOGroup, FCurMOGroupName ) = mrOK then
  begin
    miMO_GROUP.Caption := 'Группа мат. отв.: '+FCurMOGroupName;
    cmbReportPropertiesChange(nil);
  end;
end;

end.
