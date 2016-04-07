unit fMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Oracle, ImgList, ActnList, ExtCtrls, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  OracleData, dxBar, ComCtrls, ToolWin, cxSplitter, ShellApi,
	cxPC, cxGridExportLink, JclFileUtils, dxWrap, dxPrnDev, jvDbUtils, frxClass, frxDBSet,
  StdCtrls, Registry, Jpeg, word2000, cxContainer, cxCheckBox, dxPScxGrid6Lnk, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, AppEvnts, dxSkinsdxBarPainter, dxBarExtItems, ClipBrd, dxPSUtl,
  OleCtrls, SHDocVw, RVScroll, RichView, RVEdit, rvhtmlimport, RVStyle,
  cxBarEditItem, SMMainAPI, cxLabel, frxRich, JvComponentBase,
  JvAppStorage, JvAppXMLStorage, uGlobalConst,uGlobals, fDataSkins,
  dxLayoutLookAndFeels, dxSkinsdxLCPainter, dxSkinsdxStatusBarPainter,
  dxSkinsStrs,  dxStatusBar,
  cxConstantsRus, dxBarCustomize_Rus,
  dxLayoutControl, XPMan, cxLookAndFeels, dxSkinsForm, dxSkiniMaginary,
  uDBTableUtils, cxSpinEdit, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide,
  dxSkinGlassOceans, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, 
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver, dxSkinStardust,
  dxSkinSummer2008, dxSkinValentine, dxSkinXmas2008Blue, frxExportImage, cxImageComboBox;

type
  TShowPacInfo = function(HostObjHandle: THandle; pPacID: integer; EditMode: boolean; pSotrID: integer): LongInt; StdCall;

  TEditPlugin_Personal = function(HostObjHandle: THandle;
                                  App: THandle;
                                  nPacID: Integer;
                                  nSotrID: Integer;
                                  nSpecID: Integer;
                                  nSecID: Integer = -1;
                                  nSmidID: Integer = -1;
                                  nNazID: Integer = -1;
                                  bReadOnly: Boolean = false;
																	ObjID: Integer=-1;
																	hMainForm : THandle=0) : LongInt; stdcall;
  TShowPac = function (HostObjHandle: THandle; pPacID: integer; EditMode: boolean; pSotrID: integer): LongInt; stdcall;
  TFreePlugin = function(): LongInt; stdcall;

  TInitPluginQ = function(App_HND, MainForm_HND: Thandle; AWorkMode: integer;  ASotrID: Integer; APeopleID: integer = -1): TModalResult; stdcall;

  TfrmMain = class(TForm)
    os: TOracleSession;
    ilMain: TImageList;
    alMain: TActionList;
    aClose: TAction;
    dsKab: TDataSource;
    odsKab: TOracleDataSet;
    aRefresh: TAction;
    aOpen: TAction;
    odsList: TOracleDataSet;
    dsList: TDataSource;
    paKab: TPanel;
    cxGrKab: TcxGrid;
    TVKab: TcxGridDBTableView;
    VNAME: TcxGridDBColumn;
    cxGrKabLevel1: TcxGridLevel;
    cxSplitter1: TcxSplitter;
    Panel1: TPanel;
    cxGr: TcxGrid;
    TVList: TcxGridDBTableView;
    TVListFIO: TcxGridDBColumn;
    TVListDATEROJD: TcxGridDBColumn;
    TVListAGE: TcxGridDBColumn;
    TVListDS: TcxGridDBColumn;
    TVListDATERUN: TcxGridDBColumn;
    TVListNAZ: TcxGridDBColumn;
    cxGrLevel1: TcxGridLevel;
    aFill: TAction;
    pmTV: TPopupMenu;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    sdPopUp: TSaveDialog;
    al: TActionList;
    aText: TAction;
    aWeb: TAction;
    aXML: TAction;
    aXLS: TAction;
    aPrint: TAction;
    N1: TMenuItem;
    aCancel: TAction;
    TVSOS: TcxGridDBColumn;
    N2: TMenuItem;
    TVSTATE: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    TVFK_NAZTYPE: TcxGridDBColumn;
    TVDATENAZ: TcxGridDBColumn;
    aEdit: TAction;
    aInfo: TAction;
    aSearch: TAction;
    frxDBPrintList: TfrxDBDataset;
    frxPrintList: TfrxReport;
    ApplicationEvents1: TApplicationEvents;
    aProsmotr: TAction;
    frxRepProsmotr: TfrxReport;
    BM: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    BMBar1: TdxBar;
    bbRefresh: TdxBarButton;
    bbInfo: TdxBarButton;
    bbFind: TdxBarButton;
    bbOpenMK: TdxBarButton;
    dxBarButton6: TdxBarButton;
    bbEdit: TdxBarButton;
    dxBarButton8: TdxBarButton;
    dxBarButton10: TdxBarButton;
    dxBarButton11: TdxBarButton;
    dxBarButton12: TdxBarButton;
    dxBarDockControl2: TdxBarDockControl;
    BMBar2: TdxBar;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    paDate: TPanel;
    p1: TPanel;
    p2: TPanel;
    p3: TPanel;
    p4: TPanel;
    p5: TPanel;
    p6: TPanel;
    p7: TPanel;
    blWeeks: TButton;
    blMon: TButton;
    brWeeks: TButton;
    brMon: TButton;
    pMonth: TPanel;
    aPrintKab: TAction;
    aTextKab: TAction;
    aWebKab: TAction;
    aXMLKab: TAction;
    aXLSKab: TAction;
    pmKab: TPopupMenu;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    Web1: TMenuItem;
    XLS1: TMenuItem;
    XLS2: TMenuItem;
    frxRepKab: TfrxReport;
    frxDBKab: TfrxDBDataset;
    aCopyFIO: TAction;
    N8: TMenuItem;
    bbDolg: TdxBarButton;
    aDolg: TAction;
    TVUCH: TcxGridDBColumn;
    bbArchive: TdxBarButton;
    aArchive: TAction;
    RVStyle1: TRVStyle;
    RvHtmlImporter1: TRvHtmlImporter;
    rve1: TRichViewEdit;
    aPac: TAction;
    cxAll: TcxBarEditItem;
    dxdeDate: TcxBarEditItem;
    DateText: TcxStyle;
    VListNAPR: TcxGridDBColumn;
    odsListAll: TOracleDataSet;
    aHide: TAction;
    aShow: TAction;
    tmrCheckApplication: TTimer;
    stBold: TcxStyle;
    VListPLACE: TcxGridDBColumn;
    aBerem: TAction;
    N3: TMenuItem;
    aMS: TAction;
    N4: TMenuItem;
    odsList_4AllBase: TOracleDataSet;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    DateTimeField4: TDateTimeField;
    FloatField13: TFloatField;
    FloatField14: TFloatField;
    FloatField15: TFloatField;
    StringField12: TStringField;
    DateTimeField5: TDateTimeField;
    FloatField16: TFloatField;
    StringField13: TStringField;
    StringField14: TStringField;
    FloatField17: TFloatField;
    DateTimeField6: TDateTimeField;
    StringField15: TStringField;
    IntegerField2: TIntegerField;
    FloatField18: TFloatField;
    StringField16: TStringField;
    StringField17: TStringField;
    FloatField19: TFloatField;
    StringField18: TStringField;
    StringField19: TStringField;
    StringField20: TStringField;
    FloatField20: TFloatField;
    StringField21: TStringField;
    StringField22: TStringField;
    StringField23: TStringField;
    odsListAll_4AllBase: TOracleDataSet;
    FloatField21: TFloatField;
    FloatField22: TFloatField;
    DateTimeField7: TDateTimeField;
    FloatField23: TFloatField;
    FloatField24: TFloatField;
    FloatField25: TFloatField;
    StringField24: TStringField;
    DateTimeField8: TDateTimeField;
    FloatField26: TFloatField;
    StringField25: TStringField;
    StringField26: TStringField;
    FloatField27: TFloatField;
    DateTimeField9: TDateTimeField;
    StringField27: TStringField;
    IntegerField3: TIntegerField;
    FloatField28: TFloatField;
    StringField28: TStringField;
    StringField29: TStringField;
    FloatField29: TFloatField;
    StringField30: TStringField;
    StringField31: TStringField;
    StringField32: TStringField;
    FloatField30: TFloatField;
    StringField33: TStringField;
    StringField34: TStringField;
    StringField35: TStringField;
    odsListAllKardio: TOracleDataSet;
    FloatField31: TFloatField;
    FloatField32: TFloatField;
    DateTimeField10: TDateTimeField;
    FloatField33: TFloatField;
    FloatField34: TFloatField;
    FloatField35: TFloatField;
    StringField36: TStringField;
    DateTimeField11: TDateTimeField;
    FloatField36: TFloatField;
    StringField37: TStringField;
    StringField38: TStringField;
    FloatField37: TFloatField;
    DateTimeField12: TDateTimeField;
    StringField39: TStringField;
    IntegerField4: TIntegerField;
    FloatField38: TFloatField;
    StringField40: TStringField;
    StringField41: TStringField;
    FloatField39: TFloatField;
    StringField42: TStringField;
    StringField43: TStringField;
    StringField44: TStringField;
    FloatField40: TFloatField;
    StringField45: TStringField;
    StringField46: TStringField;
    StringField47: TStringField;
    odsListKardio: TOracleDataSet;
    FloatField41: TFloatField;
    FloatField42: TFloatField;
    DateTimeField13: TDateTimeField;
    FloatField43: TFloatField;
    FloatField44: TFloatField;
    FloatField45: TFloatField;
    StringField48: TStringField;
    DateTimeField14: TDateTimeField;
    FloatField46: TFloatField;
    StringField49: TStringField;
    StringField50: TStringField;
    FloatField47: TFloatField;
    DateTimeField15: TDateTimeField;
    StringField51: TStringField;
    IntegerField5: TIntegerField;
    FloatField48: TFloatField;
    StringField52: TStringField;
    StringField53: TStringField;
    FloatField49: TFloatField;
    StringField54: TStringField;
    StringField55: TStringField;
    StringField56: TStringField;
    FloatField50: TFloatField;
    StringField57: TStringField;
    StringField58: TStringField;
    StringField59: TStringField;
    odsListAll_4AllBaseSTATUSMK: TStringField;
    odsList_4AllBaseSTATUSMK: TStringField;
    odsListAllKardioSTATUSMK: TStringField;
    odsListKardioSTATUSMK: TStringField;
    VListStatusKart: TcxGridDBColumn;
    VNAZTYPE: TcxGridDBColumn;
    odsListAll_4AllBaseSTATUSTALON: TStringField;
    odsList_4AllBaseSTATUSTALON: TStringField;
    odsListKardioSTATUSTALON: TStringField;
    odsListAllKardioSTATUSTALON: TStringField;
    VListStatusTalon: TcxGridDBColumn;
    frxRichObject1: TfrxRichObject;
    N9: TMenuItem;
    aQ: TAction;
    aAddQ: TAction;
    aEditQ: TAction;
    aDelQ: TAction;
    aBackQ: TAction;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    AppStorage: TJvAppXMLFileStorage;
    VListCntLek: TcxGridDBColumn;
    odsListAll_4AllBaseCNT_LEK: TFloatField;
    odsList_4AllBaseCNT_LEK: TFloatField;
    odsListAllKardioCNT_LEK: TFloatField;
    odsListKardioCNT_LEK: TFloatField;
    aSysInfo: TAction;
    bbPac: TdxBarLargeButton;
    bbBerem: TdxBarLargeButton;
    rListMGR: TfrxReport;
    odsListAllMC: TOracleDataSet;
    FloatField51: TFloatField;
    FloatField52: TFloatField;
    DateTimeField16: TDateTimeField;
    FloatField53: TFloatField;
    FloatField54: TFloatField;
    FloatField55: TFloatField;
    StringField60: TStringField;
    DateTimeField17: TDateTimeField;
    FloatField56: TFloatField;
    StringField61: TStringField;
    StringField62: TStringField;
    FloatField57: TFloatField;
    DateTimeField18: TDateTimeField;
    StringField63: TStringField;
    IntegerField6: TIntegerField;
    FloatField58: TFloatField;
    StringField64: TStringField;
    StringField65: TStringField;
    FloatField59: TFloatField;
    StringField66: TStringField;
    StringField67: TStringField;
    StringField68: TStringField;
    FloatField60: TFloatField;
    StringField69: TStringField;
    StringField70: TStringField;
    StringField71: TStringField;
    StringField72: TStringField;
    StringField73: TStringField;
    FloatField61: TFloatField;
    odsListMC: TOracleDataSet;
    FloatField62: TFloatField;
    FloatField63: TFloatField;
    DateTimeField19: TDateTimeField;
    FloatField64: TFloatField;
    FloatField65: TFloatField;
    FloatField66: TFloatField;
    StringField74: TStringField;
    DateTimeField20: TDateTimeField;
    FloatField67: TFloatField;
    StringField75: TStringField;
    StringField76: TStringField;
    FloatField68: TFloatField;
    DateTimeField21: TDateTimeField;
    StringField77: TStringField;
    IntegerField7: TIntegerField;
    FloatField69: TFloatField;
    StringField78: TStringField;
    StringField79: TStringField;
    FloatField70: TFloatField;
    StringField80: TStringField;
    StringField81: TStringField;
    StringField82: TStringField;
    FloatField71: TFloatField;
    StringField83: TStringField;
    StringField84: TStringField;
    StringField85: TStringField;
    StringField86: TStringField;
    StringField87: TStringField;
    FloatField72: TFloatField;
    VListColumn1: TcxGridDBColumn;
    odsListAll_4AllBasePROFP_DOG: TStringField;
    odsList_4AllBasePROFP_DOG: TStringField;
    dxSkinController1: TdxSkinController;
    cxLookAndFeelController1: TcxLookAndFeelController;
    XPManifest1: TXPManifest;
    frxRepProsmotrSO: TfrxReport;
    VListColumn_SEX_LITER: TcxGridDBColumn;
    VListCNT_NV_NAZ: TcxGridDBColumn;
    VListISPOLFIO: TcxGridDBColumn;
    dxBarDateCombo1: TdxBarDateCombo;
    dxdeDate2: TcxBarEditItem;
    aOnko: TAction;
    bbOnko: TdxBarLargeButton;
    cxImageList1: TcxImageList;
    qOnkoUchet: TOracleQuery;
    odsListKardioUnKabinet: TOracleDataSet;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    DateTimeField1: TDateTimeField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    StringField1: TStringField;
    DateTimeField2: TDateTimeField;
    FloatField6: TFloatField;
    StringField2: TStringField;
    StringField3: TStringField;
    FloatField7: TFloatField;
    DateTimeField3: TDateTimeField;
    StringField4: TStringField;
    IntegerField1: TIntegerField;
    FloatField8: TFloatField;
    StringField5: TStringField;
    StringField6: TStringField;
    FloatField9: TFloatField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    FloatField10: TFloatField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField88: TStringField;
    StringField89: TStringField;
    StringField90: TStringField;
    FloatField73: TFloatField;
    grdbtvID: TcxGridDBColumn;
    VListIsAmb: TcxGridDBColumn;
    VListGROUP_HEALTH: TcxGridDBColumn;
    VListSROK_BER: TcxGridDBColumn;
    odsListAll_4AllBaseSROK_BER: TFloatField;
    odsListAll_4AllBaseSEX_LITER: TStringField;
    odsListAll_4AllBaseCNT_NV_NAZ: TFloatField;
    odsListAll_4AllBaseIS_AMB_1: TFloatField;
    odsList_4AllBaseSROK_BER: TFloatField;
    odsList_4AllBaseSEX_LITER: TStringField;
    odsList_4AllBaseCNT_NV_NAZ: TFloatField;
    odsList_4AllBaseIS_AMB_1: TFloatField;
    odsListAllKardioPROFP_DOG: TStringField;
    odsListAllKardioSROK_BER: TFloatField;
    odsListAllKardioSEX_LITER: TStringField;
    odsListAllKardioCNT_NV_NAZ: TFloatField;
    odsListAllKardioIS_AMB_1: TFloatField;
    odsListKardioPROFP_DOG: TStringField;
    odsListKardioSROK_BER: TFloatField;
    odsListKardioSEX_LITER: TStringField;
    odsListKardioCNT_NV_NAZ: TFloatField;
    odsListKardioIS_AMB_1: TFloatField;
    odsListAll_4AllBaseW_CONSULT: TStringField;
    odsList_4AllBaseW_CONSULT: TStringField;
    odsListAllKardioW_CONSULT: TStringField;
    odsListKardioW_CONSULT: TStringField;
    VListW_CONSULT: TcxGridDBColumn;
    VListNext_yavk: TcxGridDBColumn;
    procedure aCloseExecute(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure aOpenExecute(Sender: TObject);
    procedure odsKabAfterScroll(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aFillExecute(Sender: TObject);
    procedure aTextExecute(Sender: TObject);
    procedure aWebExecute(Sender: TObject);
    procedure aXMLExecute(Sender: TObject);
    procedure aXLSExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure odsListAfterScroll(DataSet: TDataSet);
    procedure TVListCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure N2Click(Sender: TObject);
    procedure frx30GetValue(const VarName: String; var Value: Variant);
    procedure odsKabBeforeOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure blMonClick(Sender: TObject);
    procedure blWeeksClick(Sender: TObject);
    procedure p1Click(Sender: TObject);
    procedure p2Click(Sender: TObject);
    procedure p3Click(Sender: TObject);
    procedure p4Click(Sender: TObject);
    procedure p5Click(Sender: TObject);
    procedure p6Click(Sender: TObject);
    procedure p7Click(Sender: TObject);
    procedure brWeeksClick(Sender: TObject);
    procedure brMonClick(Sender: TObject);
    procedure aInfoExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aSearchExecute(Sender: TObject);
    procedure frxPrintListGetValue(const VarName: String;
      var Value: Variant);
    procedure tbnPrintClick(Sender: TObject);
    procedure cxDateEdit1PropertiesChange(Sender: TObject);
    procedure TVListCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure ApplicationEvents1Message(var Msg: tagMSG; var Handled: Boolean);
    procedure aProsmotrExecute(Sender: TObject);
    procedure frxRepProsmotrGetValue(const VarName: string; var Value: Variant);
    procedure aTextKabExecute(Sender: TObject);
    procedure aWebKabExecute(Sender: TObject);
    procedure aXMLKabExecute(Sender: TObject);
    procedure aXLSKabExecute(Sender: TObject);
    procedure aPrintKabExecute(Sender: TObject);
    procedure frxRepKabGetValue(const VarName: string; var Value: Variant);
    procedure odsKabAfterOpen(DataSet: TDataSet);
    procedure osAfterLogOn(Sender: TOracleSession);
    procedure aCopyFIOExecute(Sender: TObject);
    procedure aDolgExecute(Sender: TObject);
    procedure aArchiveExecute(Sender: TObject);
    procedure aPacExecute(Sender: TObject);
    procedure cxAllPropertiesEditValueChanged(Sender: TObject);
    procedure dxdeDateChange(Sender: TObject);
    procedure odsListAllAfterScroll(DataSet: TDataSet);
    procedure aHideExecute(Sender: TObject);
    procedure aShowExecute(Sender: TObject);
    procedure tmrCheckApplicationTimer(Sender: TObject);
    procedure aBeremExecute(Sender: TObject);
    procedure aMSExecute(Sender: TObject);
    procedure aQExecute(Sender: TObject);
    procedure aAddQExecute(Sender: TObject);
    procedure aEditQExecute(Sender: TObject);
    procedure aDelQExecute(Sender: TObject);
    procedure aBackQExecute(Sender: TObject);
    procedure aSysInfoExecute(Sender: TObject);
    procedure rListMGRGetValue(const VarName: string; var Value: Variant);
    procedure aOnkoExecute(Sender: TObject);
    procedure TVKabCustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
  private
    ShowPacInfo: TShowPacInfo;
    sNumIB_4rep: string;
    IDNAZ: Integer;
    DLL_FORM_HANDLE: Longint;
    DateB, DateE: TDate;
    HandleDLL: THandle;
    DLLHandleSkin: THandle;
    EditPlugin_Personal: TEditPlugin_Personal;
    FreePlugin_Priem: TFreePlugin;
    FileVersion : String;
    LKONS_PRINT_HTML: Boolean;

    procedure DoRefreshSmidConst;
    procedure CheckEnabledButons;
    procedure DateChange;
    procedure DoResultHTML(nNazID, nPacID: Integer; IS_GET_HTM_OSM: Boolean = False);
    procedure BmpToJPEG(pFNAME1, pFNAME2: String);
    function PhysicalResolveFileType(AStream: TStream): Integer;
    //    function WinExecAndWait32(FileName: string; Visibility: integer): integer;
    { Private declarations }
  public
    get_dbname : string;
    Russian: HKL;
    pOTDELID: Integer;
    arFIO: array of string;
    MedotradeSign: string;
    sTextIssl_4Rep, sTextDiag_4Rep, get_sysdate_4rep, sCompanyName_4Rep, sOtdelName_4Rep: String;
    GET_SYSTEMDATE: TDate;
    pSOTRID: Integer;
    sSotrFIO: String;
    pAPPSOTRID: Integer;
    GET_KONSID: Integer;
    use_odslist_only_raspis, list_konsult_use_period: integer;
    DOP_DISP_OTDEL: Integer;
    procedure DoShowForm;
    procedure On_set_form_handle(var Msg: TMessage); message 1024 + 112;
    procedure DoSetEditRights;
    function RestoreApplication(AAppCaption: string): Boolean;
    function SetSkin(SkinName: string): boolean;
    procedure SetDesignApplication;
    function Get_Pac_NUMIB(pFK_PacID: Integer): String;
    function CheckKonsAlreadyFilled(const SmidID, PacID, CurID: Integer): Boolean;
    { Public declarations }
  end;

  function CheckStac(os: TOracleSession; nPacID: Integer; var ErrStr: String): Boolean;
  function IsAmbulance(os: TOracleSession; pFK_PACID: Integer; S_Message: Boolean = False): Boolean;

var
  frmMain: TfrmMain;
  get_nazcancel, get_vipnaz, get_nazplan, get_nevip, get_recomend, list_konsult_only_diagnazprint,
  list_visible_row_allkabinet : Integer;
  IB_CHECK_STAC: Boolean;
  
implementation

uses uPeriod, fSearch, fPacInfoKonsult, fWait, fDolgTalon, fArchive, fOtmena,
     fNeyav, fMS, fSetMS, fSysInfo, fPreview, uPrintDocument, fCheckConfidencial,
  uOnkoUchetParam;
{$R *.dfm}

function IsAmbulance(os: TOracleSession; pFK_PACID: Integer; S_Message: Boolean = False): Boolean;
var
  ods: TOracleDataSet;
begin
  Result := False;

  if S_Message
  then ShowMessage('IsAmbulance: ' + IntToStr(pFK_PACID));

  ods := TOracleDataSet.Create(nil);

  try
    ods.Session := os;
    ods.SQL.Text := 'SELECT FK_ID FROm ASU.TAMBULANCE WHERE FK_ID = :pFK_PACID';
    ods.DeclareAndSet('pFK_PACID', otInteger, pFK_PACID);
    ods.Open;
    Result := ods.RecordCount > 0;
    ods.Close;
  finally
    ods.Free;
  end;
end;

function CheckStac(os: TOracleSession; nPacID: Integer; var ErrStr: String): Boolean;
var
  ods: TOracleDataSet;
begin
  Result := True;
  ErrStr := '';
  ods := TOracleDataSet.Create(nil);

  try
    ods.Session := os;
    ods.SQL.Text := 'SELECT FK_ID, ASU.PKG_REGIST_PACFUNC.GET_PAC_FULLFIO(FK_ID) as FIO, ' + #13#10 +
      'ASU.PKG_REGIST_PACFUNC.GET_PAC_FCOTDEL(FK_ID) as OTDEL_NAME,' + #13#10 +
      'TO_CHAR(ASU.PKG_REGIST_PACFUNC.GET_PAC_INCOME(FK_ID), ''dd.mm.yyyy'') as SDATE_IN' + #13#10 +
      'FROM ASU.TKARTA' + #13#10 +
      'WHERE FP_TEK_COC <> 3 AND FK_PEPLID = ASU.PKG_REGIST_PACFUNC.GET_PEPL_ID(:pFK_PACID)' + #13#10 +
      '  AND FK_USLVIDID <> ASU.DOC_OTKAZGOSP' + #13#10 +
      'ORDER BY FK_ID DESC';
    ods.DeclareAndSet('pFK_PACID', otInteger, nPacID);
    ods.Open;

    if not(ods.RecordCount > 0)
    then exit;

    Result := False;
    ErrStr := 'Пациент ' + ods.FieldByName('FIO').AsString + ' находится в стационаре.' + #13#10 +
      'Поступил: ' + ods.FieldByName('SDATE_IN').AsString + '.' + #13#10 +
      'Текущее отделение: ' + ods.FieldByName('OTDEL_NAME').AsString + '.';
    ods.Close;
  finally
    ods.Free;
  end;
end;

function TfrmMain.CheckKonsAlreadyFilled(const SmidID, PacID, CurID: Integer): Boolean;
var
  ods: TOracleDataSet;
begin
  ods := Nil;
  Result := False;
  try
    ods := TOracleDataSet.Create(nil);
    ods.Session := os;
    ods.SQL.Text := 'Select * from asu.tnazkons where fk_pacid = ' + IntToStr(PacID) + ' and fk_nazsosid = asu.get_vipnaz and Trunc(fd_run) = Trunc(sysdate) and fk_smid = ' + IntToStr(SmidID);
    ods.Open;
    Result := ods.RecordCount > 0;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.On_set_form_handle(var Msg: TMessage);
begin
  if (HandleDLL > 0) and (msg.WParam > 0)
  then DLL_FORM_HANDLE := msg.WParam;
end;

procedure TfrmMain.osAfterLogOn(Sender: TOracleSession);
var
  Ver: TJclFileVersionInfo;
begin
  Sender.DBMS_Application_Info.Set_Client_Info(ParamStr(1));
	Ver := TJclFileVersionInfo.Create(ExtractFileName(ParamStr(0)));

  try
	  Sender.DBMS_Application_Info.Set_Module(ExtractFileName(ParamStr(0)) + ' (' + Ver.FileVersion + ')', Self.Name + ' "' + Self.Caption + '"');
	  FileVersion := Ver.FileVersion;
  finally
  	Ver.Free;
  end;
end;

procedure TfrmMain.aCloseExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmMain.aCopyFIOExecute(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
  Clipboard.AsText := ReplaceSubStr(dsList.DataSet.FieldByName('FIOPAC').AsString, '.', '');
end;

procedure TfrmMain.aDelQExecute(Sender: TObject);
var
  hDll: THandle;
  InitPluginQ: TInitPluginQ;
begin
  hDLL := LoadLibrary('dll_HospitalQueue.dll');

  try
    if (hDLL <> 0)
    then begin
      @InitPluginQ := GetProcAddress(hDLL, 'InitPlugin');

      if (@InitPluginQ = nil)
      then begin
        Application.MessageBox('Функция InitPlugin не найдена в dll_HospitalQueue.dll', 'Внимание', MB_OK + MB_ICONEXCLAMATION);
      end
      else begin
        try
          InitPluginQ(Application.Handle, Self.Handle, 3, pSotrID, dsList.DataSet.FieldByName('peplid').AsInteger);
        except
          on E: Exception do
          begin
            Application.MessageBox(PChar('Ошибка при запуске внешнего модуля dll_HospitalQueue.dll' + #10 + #13 + E.Message), 'Ошибка', MB_OK + MB_ICONERROR);
          end;
        end;
      end;
    end
    else begin
      Application.MessageBox('Библиотека dll_HospitalQueue.dll не найдена', 'Внимание', MB_OK + MB_ICONEXCLAMATION);
    end;
  finally
    FreeLibrary(hDLL);
  end;
end;

procedure TfrmMain.aDolgExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmDolgTalon, frmDolgTalon);
  try
    frmDolgTalon.DoShowFormTalon;
    frmDolgTalon.ShowModal;
  finally
    frmDolgTalon.Free;
  end;
end;

procedure TfrmMain.aRefreshExecute(Sender: TObject);
var id : Integer;
begin
  if (list_visible_row_allkabinet = 1) and (odsKab.FieldByName('fk_id').asinteger = -1) then
   begin
      dsList.DataSet := odsListKardioUnKabinet;
        if odsListKardioUnKabinet.active then
         id := odsListKardioUnKabinet.FieldByName('FK_ID').AsInteger
        else
         id := -1;
        odsListKardioUnKabinet.Close;
        odsListKardioUnKabinet.SetVariable('PFD_DATE', dxdeDate.EditValue);
        odsListKardioUnKabinet.SetVariable('PFK_ISPOLID', pSOTRID);
        if list_konsult_use_period = 1 then
         odsListKardioUnKabinet.SetVariable('PFD_DATE2', dxdeDate2.EditValue)
        else
         odsListKardioUnKabinet.SetVariable('PFD_DATE2', dxdeDate.EditValue);
        if get_dbname <> 'SK' then
          begin
            odsListKardioUnKabinet.SetVariable('PFK_SOTRID', pSOTRID);
            odsListKardioUnKabinet.SetVariable('PFK_OTDELID', pOTDELID);
          end;

       { if (get_dbname = 'MC') or (use_odslist_only_raspis = -1) then
          odsListKardioUnKabinet.SetVariable('PRASPRED', ' and (((isl.fl_in_raspis = 1) and exists(select 1 from asu.tpaclst where nazid = isl.fk_id and fl_bron = 0)) or (isl.fk_nazsosid = asu.get_vipnaz)) ')
        else if (use_odslist_only_raspis = 1) then
          odsListKardioUnKabinet.SetVariable('PRASPRED', ' and (((isl.fl_in_raspis = 1) and exists(select 1 from asu.tpaclst where nazid = isl.fk_id)) or (isl.fk_nazsosid = asu.get_vipnaz)) ')
        else if (use_odslist_only_raspis = 3) then
          odsListKardioUnKabinet.SetVariable('PRASPRED', ' and ((exists(select 1 from asu.tpaclst where nazid = isl.fk_id)) or (isl.fk_nazsosid = asu.get_vipnaz)) ')
        else if use_odslist_only_raspis = 2 then
          odsListKardioUnKabinet.SetVariable('praspred',' and exists (select 1 from asu.tregistnaz where fk_nazid = isl.fk_id) ')
        else                                                 }
          odsListKardioUnKabinet.SetVariable('PRASPRED', '');

        {if get_dbname = 'MC' then
          odsListAll.SetVariable('PRASPRED', ' and (((isl.fl_in_raspis = 1) and exists(select 1 from asu.tpaclst where nazid = isl.fk_id and fl_bron = 0)) or (isl.fk_nazsosid = asu.get_vipnaz)) ')
        else
          odsListAll.SetVariable('PRASPRED', ''); }
        odsListKardioUnKabinet.Open;
        odsListKardioUnKabinet.Locate('FK_ID', id, []);
   end
  else
   begin
      if cxAll.EditValue = 1 then
      begin
        dsList.DataSet := odsListAll;
      end else
      begin
        dsList.DataSet := odsList;
      end;
    if dsList.DataSet = odsList then
      begin
        if odsList.active then
         id := odsList.FieldByName('FK_ID').AsInteger
        else
         id := -1;
        odsList.Close;
        odsList.SetVariable('PFK_ROOMID', odsKab.FieldByName('FK_ID').AsInteger);
        odsList.SetVariable('PFD_DATE', dxdeDate.EditValue);
        if list_konsult_use_period = 1 then
         odsList.SetVariable('PFD_DATE2', dxdeDate2.EditValue)
        else
         odsList.SetVariable('PFD_DATE2', dxdeDate.EditValue);
        odsList.SetVariable('PFK_ISPOLID', pSOTRID);
        if get_dbname <> 'SK' then
          begin
            odsList.SetVariable('PFK_SOTRID', pSOTRID);
            odsList.SetVariable('PFK_OTDELID', pOTDELID);
          end;
        if (get_dbname = 'MC') or (use_odslist_only_raspis = -1) then
          odsList.SetVariable('PRASPRED', ' and (((isl.fl_in_raspis = 1) and exists(select 1 from asu.tpaclst where nazid = isl.fk_id and fl_bron = 0)) or (isl.fk_nazsosid = asu.get_vipnaz)) ')
        else if (use_odslist_only_raspis = 1) then
          odsList.SetVariable('PRASPRED', ' and (((isl.fl_in_raspis = 1) and exists(select 1 from asu.tpaclst where nazid = isl.fk_id)) or (isl.fk_nazsosid = asu.get_vipnaz)) ')
        else if (use_odslist_only_raspis = 3) then
          odsList.SetVariable('PRASPRED', ' and ((exists(select 1 from asu.tpaclst where nazid = isl.fk_id)) or (isl.fk_nazsosid = asu.get_vipnaz)) ')
        else if use_odslist_only_raspis = 2 then
          odsList.SetVariable('praspred',' and exists (select 1 from asu.tregistnaz where fk_nazid = isl.fk_id) ')
        else
          odsList.SetVariable('PRASPRED', '');

        {if get_dbname = 'MC' then
          odsList.SetVariable('PRASPRED', ' and (((isl.fl_in_raspis = 1) and exists(select 1 from asu.tpaclst where nazid = isl.fk_id and fl_bron = 0)) or (isl.fk_nazsosid = asu.get_vipnaz)) ')
        else
          odsList.SetVariable('PRASPRED', '');}
        if get_dbname = 'SK' then
         begin
          VListColumn1.DataBinding.FieldName := '';
          VListColumn1.Visible := false;
         end;
        odsList.Open;
        odsList.Locate('FK_ID', id, []);
      end;
    if dsList.DataSet = odsListAll then
      begin
        if odsListAll.active then
         id := odsListAll.FieldByName('FK_ID').AsInteger
        else
         id := -1;
        odsListAll.Close;
        odsListAll.SetVariable('PFK_ROOMID', odsKab.FieldByName('FK_ID').AsInteger);
        odsListAll.SetVariable('PFD_DATE', dxdeDate.EditValue);
        if list_konsult_use_period = 1 then
         odsListAll.SetVariable('PFD_DATE2', dxdeDate2.EditValue)
        else
         odsListAll.SetVariable('PFD_DATE2', dxdeDate.EditValue);
        if get_dbname <> 'SK' then
          begin
            odsListAll.SetVariable('PFK_SOTRID', pSOTRID);
            odsListAll.SetVariable('PFK_OTDELID', pOTDELID);
          end;

        if (get_dbname = 'MC') or (use_odslist_only_raspis = -1) then
          odsList.SetVariable('PRASPRED', ' and (((isl.fl_in_raspis = 1) and exists(select 1 from asu.tpaclst where nazid = isl.fk_id and fl_bron = 0)) or (isl.fk_nazsosid = asu.get_vipnaz)) ')
        else if (use_odslist_only_raspis = 1) then
          odsList.SetVariable('PRASPRED', ' and (((isl.fl_in_raspis = 1) and exists(select 1 from asu.tpaclst where nazid = isl.fk_id)) or (isl.fk_nazsosid = asu.get_vipnaz)) ')
        else if (use_odslist_only_raspis = 3) then
          odsList.SetVariable('PRASPRED', ' and ((exists(select 1 from asu.tpaclst where nazid = isl.fk_id)) or (isl.fk_nazsosid = asu.get_vipnaz)) ')
        else if use_odslist_only_raspis = 2 then
          odsList.SetVariable('praspred',' and exists (select 1 from asu.tregistnaz where fk_nazid = isl.fk_id) ')
        else
          odsList.SetVariable('PRASPRED', '');

        {if get_dbname = 'MC' then
          odsListAll.SetVariable('PRASPRED', ' and (((isl.fl_in_raspis = 1) and exists(select 1 from asu.tpaclst where nazid = isl.fk_id and fl_bron = 0)) or (isl.fk_nazsosid = asu.get_vipnaz)) ')
        else
          odsListAll.SetVariable('PRASPRED', ''); }
        odsListAll.Open;
        odsListAll.Locate('FK_ID', id, []);
      end;
   end;
end;

procedure TfrmMain.aOnkoExecute(Sender: TObject);
var
  ods : TOracleDataSet;

  f: TfrmOnkoUchetParam;
begin

  if dsList.DataSet.FieldByName('is_amb').AsInteger = 0 then begin
     Application.MessageBox('На онкоучет можно поставить только амбулаторного пациента!', 'Внимание', mb_ok + mb_iconinformation);
     Exit;
  end;

  ods := TOracleDataSet.Create(nil);
  try
     ods.Session := os;
     ods.Cursor := crSQLWait;
     ods.SQL.Text := ' select count(*) as cnt ' +
                     '   from asu.tambulance t1, asu.tdocobsl t2, asu.tonkouchet t3 ' +
                     '  where t1.fk_docobsl = t2.fk_id ' +
                     '    and t1.fk_id = t3.fk_pacid ' +
                     '    and t2.fk_viddocid = asu.DOC_AMBUL_ONKO ' +
                     '    and t1.fk_peplid = :pfk_peplid ' +
                     '    and t3.fl_status = 1'; //Поставлен на учет
    ods.DeclareAndSet('pfk_peplid', otInteger, dsList.DataSet.FieldByName('peplid').AsInteger);
    ods.Open;

    if ods.FieldByName('cnt').AsInteger > 0 then begin
        Application.MessageBox('Внимание!' + #13 + 'У данного пациента уже зарегистрирован документ "Амбулаторная карта ОНКО"!', 'Информация', mb_ok + mb_iconinformation);
        Exit;
    end;
  finally
    ods.Free;
  end;


  f := TfrmOnkoUchetParam.Create(Self, os, dsList.DataSet.FieldByName('fk_pacid').AsInteger);
  try
     if (f.ShowModal = mrOk) then begin
        qOnkoUchet.SetVariable('pfk_id', dsList.DataSet.FieldByName('fk_pacid').AsInteger);
        qOnkoUchet.SetVariable('pfk_diagid', f.GetDiagID());
        qOnkoUchet.SetVariable('pfk_sotrid', N_SOTRID);

        qOnkoUchet.Execute;
        os.Commit;
     end;
  finally
     f.Free;
  end;

end;

procedure TfrmMain.aOpenExecute(Sender: TObject);
var ods : TOracleDataSet;
    AppProcID : Integer;
begin
  if dsList.DataSet.FieldByName('is_amb').AsInteger = 1 then
    begin
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := os;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' select fl_vyb from asu.tambulance where fk_id = :pfk_id ';
        ods.DeclareAndSet('pfk_id', otInteger, dsList.DataSet.FieldByName('fk_pacid').AsInteger);
        ods.Open;
        if ods.FieldByName('fl_vyb').AsInteger = 1 then
          begin
            MessageDlg('Карта сдана в архив! Вы не можете открыть её!'+#13+#10+
                       'Для просмотра воспользуйтесь модулем "Паспорт здоровья".', mtWarning, [mbOK], 0);
            exit;
          end;
      finally
        ods.Free;
      end;
    end;
  try
    if RestoreApplication(dsList.DataSet.FieldByName('FIOPAC').AsString + ' - ' + Get_Pac_NUMIB(dsList.DataSet.FieldByName('FK_PACID').AsInteger))
    then Exit;

    SetLength(arFIO,Length(arFIO)+1);
    arFIO[Length(arFIO)-1]:=dsList.DataSet.FieldByName('FIOPAC').AsString;
    aOpen.Enabled:=False;
    Application.ProcessMessages;
    Screen.Cursor := crSQLWait;
    tmrCheckApplication.Enabled:=True;

//    AppHandle := WinExecAndWait32(PChar('IBRazdel.exe '+IntToStr(pAPPSOTRID)+' '+IntToStr(dsList.DataSet.FieldByName('FK_PACID').AsInteger)+' '+IntToStr(-1)+' '+IntToStr(-1)), 1);
//    GetInputMapAppFromApp(AppHandle);

    AppProcID := AppStart('IBRazdel.exe', IntToStr(dsList.DataSet.FieldByName('fk_pacid').AsInteger)+' '+IntToStr(-1)+' '+IntToStr(-1));
    if AppProcID = -1 then ShowMessage('Ошибка запуска приложения');
    ShowWait(dsList.DataSet.FieldByName('FK_PACID').AsInteger, True);
  finally
    Screen.Cursor := crDefault;
    aOpen.Enabled:=True;
  end;
end;

procedure TfrmMain.aPacExecute(Sender: TObject);
var hHandlPacInfo : THandle;
    AmbInfo : THandle;
    DoShowAmbInfo : function(App_HND:THandle;
                             APacID:Integer;
                             ASotrID: Integer;
                             AAppSotr: Integer;
                             ATalonId : Integer;
                             AMode : Integer) : Integer; stdcall;
    str : string;
begin
  if dsList.DataSet.FieldByName('IS_AMB').AsInteger = 1 then
    begin
      AmbInfo := LoadLibrary('DLL_RegistAmb.dll');
      try
        if AmbInfo <> 0 then
          begin
            @DoShowAmbInfo := GetProcAddress(AmbInfo, 'DoShowAmbInfo');
            if @DoShowAmbInfo = nil then
              Application.MessageBox('Функция DoShowAmbInfo не найдена в DLL_RegistAmb.dll', 'Внимание', MB_OK + MB_ICONEXCLAMATION);
            try
              DoShowAmbInfo(Application.Handle,
                            dsList.DataSet.FieldByName('PEPLID').AsInteger,
                            pSOTRID,
                            pAPPSOTRID,
                            -1,
                            -1);
            except
              on E:  Exception do
                begin
                  str :='Ошибка при запуске внешнего модуля DLL_RegistAmb.dll'+sLineBreak+E.Message;
                  Application.MessageBox(PChar(str), 'Ошибка', MB_OK + MB_ICONERROR);
                end;
            end;
        end else
        begin
          Application.MessageBox('Библиотека DLL_RegistAmb.dll не найдена', 'Внимание', MB_OK + MB_ICONEXCLAMATION);
        end;
      finally
        FreeLibrary(AmbInfo);
      end;
    end else
    begin
      hHandlPacInfo := LoadLibrary('PacInfo_DLL.dll');
      try
        if hHandlPacInfo <> 0 then
          begin
            @ShowPacInfo := GetProcAddress(hHandlPacInfo, 'ShowPacInfo');
            if @ShowPacInfo <> nil then
              begin
                Self.Update;
                ShowPacInfo(Application.Handle,
                            dsList.DataSet.FieldByName('FK_PACID').AsInteger,
                            True, // разрешение редактирования
                            pSOTRID);
              end;
          end;
      finally
        FreeLibrary(hHandlPacInfo);
      end;
    end;
end;

procedure TfrmMain.ApplicationEvents1Message(var Msg: tagMSG;
  var Handled: Boolean);
begin
  if HandleDLL > 0 then 
    case msg.message of
      WM_KEYDOWN: if ((msg.wParam>=112) and (msg.wParam<=123))or
                      ((msg.wParam>=37) and (msg.wParam<=40))or(msg.wParam=93)or(msg.wParam=33)or(msg.wParam=34)
                      or (msg.wParam=27)or (msg.wParam=9) then
                    SendMessage(DLL_FORM_HANDLE,wm_user+113,msg.wParam,msg.lParam);
     end;
end;

procedure TfrmMain.DoSetEditRights;
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT NAZ.FK_SMID FROM ASU.TVRACHKAB KAB, ASU.TVRACHKAB_NAZ NAZ '+#13+
                    '  WHERE KAB.FK_SOTRID = :PFK_SOTRID '+#13+
                    '    AND KAB.FK_ID = NAZ.FK_SOTRKABID '+#13+
                    '    AND FK_SMID = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = :PFC_SYNONIM) ';
    ods.DeclareAndSet('PFK_SOTRID', otInteger, pSOTRID);
    ods.DeclareAndSet('PFC_SYNONIM', otString, 'DIAGNOSTIC_RIGHTS_OPENMK');
    ods.Open;
    aOpen.Visible := ods.RecordCount <> 0; // Открыть МК
    ods.Close;
    ods.DeleteVariables;
    ods.DeclareAndSet('PFK_SOTRID', otInteger, pSOTRID);
    ods.DeclareAndSet('PFC_SYNONIM', otString, 'DIAGNOSTIC_RIGHTS_FILL');
    ods.Open;
    aFill.Visible := ods.RecordCount <> 0; // Заполнить
    ods.Close;
    ods.DeleteVariables;
    ods.DeclareAndSet('PFK_SOTRID', otInteger, pSOTRID);
    ods.DeclareAndSet('PFC_SYNONIM', otString, 'DIAGNOSTIC_RIGHTS_EDIT');
    ods.Open;
    aEdit.Visible := ods.RecordCount <> 0; // Изменить
    ods.Close;
    ods.DeleteVariables;
    ods.DeclareAndSet('PFK_SOTRID', otInteger, pSOTRID);
    ods.DeclareAndSet('PFC_SYNONIM', otString, 'DIAGNOSTIC_RIGHTS_OTMENA');
    ods.Open;
    aCancel.Visible := ods.RecordCount <> 0; // Отмена
    ods.Close;
    ods.DeleteVariables;
    ods.DeclareAndSet('PFK_SOTRID', otInteger, pSOTRID);
    ods.DeclareAndSet('PFC_SYNONIM', otString, 'DIAGNOSTIC_RIGHTS_BEREM');
    ods.Open;
    aBerem.Visible := ods.RecordCount <> 0; // На учёте по беременности
    ods.Close;

    ods.DeleteVariables;
    ods.DeclareAndSet('PFK_SOTRID', otInteger, pSOTRID);
    ods.DeclareAndSet('PFC_SYNONIM', otString, 'DIAGNOSTIC_RIGHTS_ONKO');
    ods.Open;
    aOnko.Visible := ods.RecordCount <> 0; // На онкоучет
    ods.Close;

    ods.DeleteVariables;
    ods.DeclareAndSet('PFK_SOTRID', otInteger, pSOTRID);
    ods.DeclareAndSet('PFC_SYNONIM', otString, 'DIAGNOSTIC_RIGHTS_QUEUE');
    ods.Open;
    aQ.Visible := ods.RecordCount <> 0; // Очередь
    ods.Close;
    ods.DeleteVariables;
    ods.DeclareAndSet('PFK_SOTRID', otInteger, pSOTRID);
    ods.DeclareAndSet('PFC_SYNONIM', otString, 'DIAGNOSTIC_RIGHTS_ADDQUEUE');
    ods.Open;
    aAddQ.Visible := ods.RecordCount <> 0; // Добавить в очередь
    ods.Close;
    ods.DeleteVariables;
    ods.DeclareAndSet('PFK_SOTRID', otInteger, pSOTRID);
    ods.DeclareAndSet('PFC_SYNONIM', otString, 'DIAGNOSTIC_RIGHTS_EDITQUEUE');
    ods.Open;
    aEditQ.Visible := ods.RecordCount <> 0; // Редактировать запись в очереди
    ods.Close;
    ods.DeleteVariables;
    ods.DeclareAndSet('PFK_SOTRID', otInteger, pSOTRID);
    ods.DeclareAndSet('PFC_SYNONIM', otString, 'DIAGNOSTIC_RIGHTS_DELQUEUE');
    ods.Open;
    aDelQ.Visible := ods.RecordCount <> 0; // Удалить запись в очереди
    ods.Close;
    ods.DeleteVariables;
    ods.DeclareAndSet('PFK_SOTRID', otInteger, pSOTRID);
    ods.DeclareAndSet('PFC_SYNONIM', otString, 'DIAGNOSTIC_RIGHTS_BACKQUEUE');
    ods.Open;
    aBackQ.Visible := ods.RecordCount <> 0; // Снят с очереди
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.DoShowForm;
var
  ods: TOracleDataSet;
begin
  frmMain.Show;
  DoRefreshSmidConst;
  // -- определяем датасеты для различных БД
  odsList.SQL.Text    := odsList_4AllBase.SQL.Text;
  odsListAll.SQL.Text := odsListAll_4AllBase.SQL.Text;

  if get_dbname = 'SK'
  then begin
    odsList.SQL.Text := odsListKardio.SQL.Text;
    odsList.DeleteVariable('pfk_otdelid');
    odsList.DeleteVariable('pfk_sotrid');
    odsListAll.SQL.Text := odsListAllKardio.SQL.Text;
    odsListAll.DeleteVariable('pfk_otdelid');
    odsListAll.DeleteVariable('pfk_sotrid');
  end;

  if get_dbname = 'MC'
  then begin
    odsList.SQL.Text := odsListMC.SQL.Text;
    odsListAll.SQL.Text := odsListAllMC.SQL.Text;
  end;

  pAPPSOTRID := StrToInt(paramstr(1));
  ods := TOracleDataSet.Create(nil);

  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT FK_SOTRID, '+#13+
                    '        ASU.DO_VRACHFIO(FK_SOTRID) AS SOTRFIO, '+#13+
                    '        ASU.PKG_SMINI.READSTRING(''CONFIG'', ''S_FULLNAME'', '''') AS COMPANYNAME, '+#13+
                    '        (SELECT FC_NAME '+#13+
                    '                FROM ASU.TOTDEL '+#13+
                    '          WHERE FK_ID = (SELECT FK_OTDID FROM ASU.TSOTR WHERE FK_ID = TAPPSOTR.FK_SOTRID)) AS OTDELNAME '+#13+
                    '   FROM LOGIN.TAPPSOTR WHERE FL_DEL <> 1 AND FK_ID = :PFK_ID ';
    ods.DeclareAndSet('PFK_ID', otInteger, pAPPSOTRID);
    ods.Open;
    pSOTRID := ods.FieldByName('FK_SOTRID').AsInteger;

    if get_dbname = 'SK' //Melnikov 2014.09.18 #31859
    then odsListAll.declareandSet('pfk_ispolid', otinteger, pSOTRID);

    sSotrFIO := ods.FieldByName('SOTRFIO').AsString;
    sCompanyName_4Rep := ods.FieldByName('COMPANYNAME').AsString;
    sOtdelName_4Rep := ods.FieldByName('OTDELNAME').AsString;
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' SELECT FK_OTDID FROM ASU.TSOTR WHERE FK_ID = :PFK_ID ';
    ods.DeclareAndSet('PFK_ID', otInteger, pSOTRID);
    ods.Open;
    pOTDELID := ods.FieldByName('FK_OTDID').AsInteger;
    odsKab.AfterScroll := nil;

    if pOTDELID = DOP_DISP_OTDEL
    then odsList.SQL.Text := StringReplace(odsList.SQL.Text,
      '/*SQL_DOP_GRZ*/',
      ', (SELECT MAX(ts.FC_NAME)' + #13#10 +
      'FROM ASU.TAMBTALON_NAZ tn INNER JOIN ASU.TAMBTALON ta' + #13#10 +
      'ON tn.fk_talonid = ta.fk_id INNER JOIN ASU.TDIAGDETAIL tdd' + #13#10 +
      'ON ta.fk_diagmain = tdd.fk_diagid INNER JOIN ASU.TSMID ts' + #13#10 +
      'ON tdd.fk_grupid = ts.fk_id' + #13#10 +
      'WHERE tn.fk_nazid = ISL.FK_ID) as GROUP_HEALTH',
      [rfReplaceAll])
    else odsList.SQL.Text := StringReplace(odsList.SQL.Text, '/*SQL_DOP_GRZ*/',
      ', NULL as GROUP_HEALTH', [rfReplaceAll]);    

    if list_visible_row_allkabinet = 1
    then odsKab.SetVariable('PALLKABS','select -1 as fk_id, ''Все кабинеты'' as fc_name, -1 as fn_order from dual union all ');

    odsKab.Open;
    cxall.enabled := odsKab.fieldbyname('fk_id').asinteger > -1;
    odsKab.AfterScroll := odsKabAfterScroll;
    dxdeDate.EditValue := GET_SYSTEMDATE;
    dxdeDate2.EditValue := GET_SYSTEMDATE;
    frmMain.Caption := '';
    frmMain.Caption := 'Журнал консультаций('+FileVersion+'). '+'Пользователь: '+sSotrFIO+ '; Кабинет: '+odsKab.FieldByName('FC_NAME').AsString;
    cxGr.SetFocus;
    TVList.StoreToRegistry('\SoftWare\SoftMaster\List_konsult1.1\cxGrVrach_' + IntToStr(pSOTRID)+'Default', True, [], 'cxGr');
    TVList.RestoreFromRegistry('\SoftWare\SoftMaster\List_konsult1.1\cxGrVrach_' + IntToStr(pSOTRID), False, False, [], 'cxGr');
    DoSetEditRights;
    MedotradeSign := ReadMedotradeSign;

    // -- для Кардио меняем название колонок и показываем/не показываем колонку "Статус карты"
    if get_dbname <> 'SK'
    then begin
      VListPLACE.Caption := 'Место обслуживания';
      TVUCH.Caption := 'Участок';
      VListStatusKart.Visible := False;
      VListStatusKart.Hidden := True;
      VListStatusTalon.Visible := False;
      VListStatusTalon.Hidden := True;
      VNAZTYPE.Caption := 'Тип';
    end
    else begin
      VListPLACE.Caption := 'Вид оплаты';
      TVUCH.Caption := 'Тип приема';
      VListStatusKart.Visible := True;
      VListStatusKart.Hidden := False;
      VListStatusTalon.Visible := True;
      VListStatusTalon.Hidden := False;
      VNAZTYPE.Caption := 'Комментарии';
    end;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.dxdeDateChange(Sender: TObject);
begin
  DateChange;
  paDate.Repaint;
  paDate.Refresh;
  p1.Repaint;
  p1.Refresh;
  p2.Repaint;
  p2.Refresh;
  p3.Repaint;
  p3.Refresh;
  p4.Repaint;
  p4.Refresh;
  p5.Repaint;
  p5.Refresh;
  p6.Repaint;
  p6.Refresh;
  p7.Repaint;
  p7.Refresh;
  aRefreshExecute(nil);
end;

procedure TfrmMain.odsKabAfterOpen(DataSet: TDataSet);
begin
  aPrintKab.Enabled := odsKab.RecordCount <> 0;
end;

procedure TfrmMain.odsKabAfterScroll(DataSet: TDataSet);
begin
  cxAll.enabled := odsKab.fieldbyname('fk_id').AsInteger > -1;

  aRefreshExecute(Self);
  frmMain.Caption := '';
  frmMain.Caption := 'Журнал консультаций('+FileVersion+'). Пользователь: '+sSotrFIO+ '; Кабинет: '+odsKab.FieldByName('FC_NAME').AsString;
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var Reg : TRegIniFile;
begin
//------------------------------------------------------------------------------
  Reg := TRegIniFile.Create;
  Reg.RootKey:=HKEY_CURRENT_USER;
  if not Reg.OpenKey('\Software\Softmaster\List_konsult\', FALSE) then
   begin
     Reg.CreateKey('\Software\Softmaster\List_konsult');
   end;
  try
    Reg.WriteInteger('\Software\Softmaster\List_konsult\ID_SOTR'+IntToStr(pSOTRID), 'ID_KABINET', odsKab.FieldByName('FK_ID').AsInteger);
//    Reg.WriteInteger('\Software\Softmaster\List_konsult'+'\ID_SOTR'+IntToStr(pSOTRID), 'ID_OTMENA',  cxPrOtmena.EditValue);
  except
  end;
  Reg.Free;
//------------------------------------------------------------------------------
  TVList.StoreToRegistry('\SoftWare\SoftMaster\List_konsult1.1\cxGr'+'Vrach'+ '_' + IntToStr(pSOTRID), TRUE, [], 'cxGr');
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Application.MessageBox('Вы хотите выйти из приложения ?', 'Вопрос', MB_YESNO + MB_ICONQUESTION) = MrYes then
    action := caFree
  else
    action := caNone;
end;

procedure TfrmMain.aFillExecute(Sender: TObject);  
var
  ods: TOracleDataSet;
  ErrStr: String;
begin
// -- проверка на возможность выполнения Нельзя добавлять в список
  ods := TOracleDataSet.Create(nil);

  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select count(*) as cnt '+#13+
                    '   from asu.tvrachkab_naz t1, asu.tvrachkab t2 '+#13+
                    '  where t1.fk_sotrkabid = t2.fk_id '+#13+
                    '    and t2.fk_sotrid = :pfk_sotrid '+#13+
                    '    and t1.fk_smid = :pfk_smid ';
    ods.DeclareAndSet('pfk_sotrid', otInteger, pSOTRID);
    ods.DeclareAndSet('pfk_smid', otInteger, dsList.DataSet.FieldByName('fk_smid').AsInteger);
    ods.Open;

    if ods.FieldByName('cnt').AsInteger = 0
    then begin
      MessageDlg('Внимание!'+#13+#10+
                   'У Вас нет прав для заполнения данной консультации!'+#13+#10+'Обратитесь к администратору системы!', mtWarning, [mbOK], 0);
      exit;
    end;
  finally
    ods.Free;
  end;
  if (get_dbname = 'SO')
      and CheckKonsAlreadyFilled(dsList.DataSet.FieldByName('fk_smid').AsInteger, dsList.DataSet.FieldByName('FK_PACID').AsInteger, -1) then
  begin
    MessageDlg('На ' + DateToStr(Now)+ ' уже есть заполненный протокол консультации.' + #13#10 + 'Нельзя заполнить 2 одинаковых протокола в один день.' +#13#10 + 'Выберите другой осмотр или обратитесь к администратору.', mtError, [mbOK], 0);
    Exit;
  end;
  if IB_CHECK_STAC
  then begin
    if IsAmbulance(frmMain.os, dsList.DataSet.FieldByName('FK_PACID').AsInteger)
    then begin
      ErrStr := '';

      if not CheckStac(frmMain.os, dsList.DataSet.FieldByName('FK_PACID').AsInteger, ErrStr)
      then begin
        if Application.MessageBox(PAnsiChar(ErrStr + #13#10 +
          'Вы хотите заполнить осмотр?'), 'Внимание', MB_YESNO + MB_ICONQUESTION) = mrNo
        then begin
          exit;
        end;
      end;
    end;
  end;

// -- вызов dll
  IDNAZ := dsList.DataSet.FieldByName('FK_ID').AsInteger;
  HandleDLL := 0;
  HandleDLL := LoadLibrary('PriemDll.dll');

  if HandleDLL > 0
  then begin
    try
      EditPlugin_Personal := GetProcAddress(HandleDLL, 'EditPlugin_Personal');
      FreePlugin_Priem := GetProcAddress(HandleDLL, 'FreePlugin');

      if @EditPlugin_Personal <> nil
      then begin
        try
          EditPlugin_Personal(Panel1.Handle, //хэндл панели
															Application.Handle, //хэндл аппликейшена
															dsList.DataSet.FieldByName('FK_PACID').AsInteger, //код пациента
															pSOTRID, //код сотрудника
															pAPPSOTRID, //специализация
                              -1, //секция
															-1, //odsList.FieldByName('FK_SMID').AsInteger, //смид
															dsList.DataSet.FieldByName('FK_ID').AsInteger, //назид
															FALSE,
															dsList.DataSet.FieldByName('FK_ID').AsInteger, //ид объекта
															Panel1.Parent.Handle);

          if @FreePlugin_Priem <> nil
          then FreePlugin_Priem;
        except
        end;
      end;
    finally
      Application.ProcessMessages;
      FreeLibrary(HandleDLL);
      HandleDll := 0;
    end;
  end;

  RefreshQuery(dsList.DataSet);
  dsList.DataSet.Locate('FK_ID', IDNAZ, []);
end;

procedure TfrmMain.aHideExecute(Sender: TObject);
begin
  cxSplitter1.CloseSplitter;
end;

procedure TfrmMain.aTextExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'txt';
  sdPopUp.Filter := 'Текстовые файлы (*.txt)|*.txt';
  if sdPopUp.Execute then
    if TVList.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToText(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToText(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.aTextKabExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'txt';
  sdPopUp.Filter := 'Текстовые файлы (*.txt)|*.txt';
  if sdPopUp.Execute then
    if TVKab.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToText(sdPopUp.FileName, cxGrKab, TRUE, FALSE)
    else
      ExportGridToText(sdPopUp.FileName, cxGrKab, TRUE, TRUE);
end;

procedure TfrmMain.aWebExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'html';
  sdPopUp.Filter := 'Web-страницы (*.html)|*.html';
  if sdPopUp.Execute then
    if TVList.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToHTML(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToHTML(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.aWebKabExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'html';
  sdPopUp.Filter := 'Web-страницы (*.html)|*.html';
  if sdPopUp.Execute then
    if TVKab.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToHTML(sdPopUp.FileName, cxGrKab, TRUE, FALSE)
    else
      ExportGridToHTML(sdPopUp.FileName, cxGrKab, TRUE, TRUE);
end;

procedure TfrmMain.aXMLExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xml';
  sdPopUp.Filter := 'XML-страницы (*.xml)|*.xml';
  if sdPopUp.Execute then
    if TVList.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToXML(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToXML(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.aXMLKabExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xml';
  sdPopUp.Filter := 'XML-страницы (*.xml)|*.xml';
  if sdPopUp.Execute then
    if TVKab.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToXML(sdPopUp.FileName, cxGrKab, TRUE, FALSE)
    else
      ExportGridToXML(sdPopUp.FileName, cxGrKab, TRUE, TRUE);
end;

procedure TfrmMain.aXLSExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    if TVList.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToExcel(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToExcel(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.aXLSKabExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    if TVKab.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToExcel(sdPopUp.FileName, cxGrKab, TRUE, FALSE)
    else
      ExportGridToExcel(sdPopUp.FileName, cxGrKab, TRUE, TRUE);
end;

procedure TfrmMain.aPrintExecute(Sender: TObject);
var ods : TOracleDataSet;
     id : Integer;
begin
  id := dsList.DataSet.FieldByName('fk_id').AsInteger;
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select to_char(sysdate, ''dd.mm.yyyy hh24:mi'') as systemdate from dual ';
    ods.Open;
    GET_SYSDATE_4REP := ods.FieldByName('SYSTEMDATE').AsString;
  finally
    ods.Free;
  end;
  if dsList.DataSet = odsList then
    frxDBPrintList.DataSet := odsList;
  if dsList.DataSet = odsListAll then
    frxDBPrintList.DataSet := odsListAll;
  if get_dbname = 'MC' then
    begin
      rListMGR.ShowReport;
      dsList.DataSet.Locate('fk_id', id, []);
      exit;
    end;
  frxPrintList.ShowReport;
  dsList.DataSet.Locate('fk_id', id, []);
end;

procedure TfrmMain.aPrintKabExecute(Sender: TObject);
var ods : TOracleDataSet;
     id : Integer;
begin
  odsKab.AfterScroll := nil;
  id := odsKab.FieldByName('FK_ID').AsInteger;
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT TO_CHAR(SYSDATE, ''DD.MM.YYYY HH24:MI'') AS SYSTEMDATE '+
                    '   FROM DUAL ';
    ods.Open;
    GET_SYSDATE_4REP := ods.FieldByName('SYSTEMDATE').AsString;
  finally
    ods.Free;
  end;
  frxRepKab.ShowReport;
  odsKab.Locate('FK_ID', id, []);
  odsKab.AfterScroll := odsKabAfterScroll;
end;

procedure TfrmMain.aProsmotrExecute(Sender: TObject);
var ods : TOracleDataSet;
    mem : TMemoryStream;
    str1, str2 : TStringList;
    function IsPoliklOtdel():boolean;
    var
      ods : toracledataset;
    begin
      if list_konsult_only_diagnazprint = 1 then
       begin
        try
          ods := toracledataset.create(nil);
          ods.session := os;
          ods.sql.text := 'select 1 from login.tsotr where fk_id = :pid and fk_otdelid in (select fk_id from login.totdel connect by prior fk_id = fk_ownerid start with fk_id = asu.get_polikotdel)';
          ods.declareandset('pid',otinteger, pSOTRID);
          ods.open;
          result := ods.recordcount > 0;
        finally
          ods.free;
        end;
       end
      else
       result := false;
    end;
begin
  if (get_dbname = 'MC') OR LKONS_PRINT_HTML
  then // Междуреченск
    begin
      DoResultHTML(dsList.DataSet.FieldByName('fk_id').AsInteger, dsList.DataSet.FieldByName('fk_pacid').AsInteger, LKONS_PRINT_HTML); // формируем в HTML
    end else
    begin
      mem := TMemoryStream.Create;
      str1 := TStringList.Create;
      str2 := TStringList.Create;
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := os;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' SELECT STAT.GET_RES_KONSULT_DIAGNAZ((SELECT FK_ID FROM ASU.VRES WHERE FK_NAZID = :PFK_PACID)) AS KONS, '+#13+
                        '        (SELECT FB_HTML FROM ASU.TRICHVIEWDATA WHERE FK_PACID = :PFK_PACID) AS FB_TEXT, '+#13+
                        '        ASU.GET_IB(:PFK_PACID1) AS NUMIB '+#13+
                        '    FROM DUAL ';
        ods.DeclareAndSet('PFK_PACID', otInteger, dsList.DataSet.FieldByName('FK_ID').AsInteger); // назначение
        ods.DeclareAndSet('PFK_PACID1', otInteger, dsList.DataSet.FieldByName('FK_PACID').AsInteger); // пациент
        ods.Open;

        RvHtmlImporter1.LoadHtml(ods.FieldByName('KONS').AsString); // формируем диагнозы и назначения
        rve1.SaveTextToStream('', mem, 0, False, True);
        mem.Position := 0;
        str1.LoadFromStream(mem);
        mem.Clear;
        rve1.Clear;
        rve1.Reformat;

        if not IsPoliklOtdel then
         begin
          RvHtmlImporter1.LoadHtml(ods.FieldByName('FB_TEXT').AsString); // формируем основной текст протокола
          rve1.SaveRTFToStream(mem, false);
          mem.Position := 0;
          str2.LoadFromStream(mem);
          mem.Clear;
          rve1.Clear;
          rve1.Reformat;
         end; 

        sNumIB_4rep := ods.FieldByName('NUMIB').AsString;

        sTextIssl_4Rep := str2.Text;
        sTextDiag_4Rep := str1.Text;
        str1.Clear;
        str2.Clear;
        if get_dbname = 'SO' then
         frxRepProsmotrSO.ShowReport
        else
         frxRepProsmotr.ShowReport;
      finally
        mem.Free;
        str1.Free;
        str2.Free;
        ods.Free;
      end;
    end;
end;

procedure TfrmMain.aQExecute(Sender: TObject);
var hDll : THandle;
    InitPluginQ : TInitPluginQ;
begin
  hDLL := LoadLibrary('dll_HospitalQueue.dll');
  try
    if (hDLL <> 0) then
      begin
        @InitPluginQ := GetProcAddress(hDLL, 'InitPlugin');
        if (@InitPluginQ = nil) then
          begin
            Application.MessageBox('Функция InitPlugin не найдена в dll_HospitalQueue.dll', 'Внимание', MB_OK + MB_ICONEXCLAMATION);
          end else
          begin
            try
              InitPluginQ(Application.Handle, Self.Handle, 0, pSotrID, -1);
            except
            on E : Exception do begin
              Application.MessageBox(PChar('Ошибка при запуске внешнего модуля dll_HospitalQueue.dll' + #10 + #13 + E.Message), 'Ошибка', MB_OK + MB_ICONERROR);
            end;
            end;
          end;
      end else
      begin
        Application.MessageBox('Библиотека dll_HospitalQueue.dll не найдена', 'Внимание', MB_OK + MB_ICONEXCLAMATION);
      end;
  finally
    FreeLibrary(hDLL);
  end;
end;

procedure TfrmMain.DoRefreshSmidConst;
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
	  ods.SQL.Text := ' SELECT ASU.GET_NAZCANCEL, ASU.GET_VIPNAZ, ASU.GET_NAZPLAN, ASU.GET_NEVIP, ASU.GET_RECOMEND, ASU.GET_KONSID, '+#13+
                    '        TRUNC(SYSDATE) AS SYSTEMDATE, '+#13+
                    '        ASU.PKG_SMINI.READSTRING(''CONFIG'', ''DB_NAME'', ''H'') AS DB_NAME /*,list_konsult_only_diagnazprint*/ '+#13+
                    '   FROM DUAL ';
    ods.Close;
    ods.Open;
    get_nazcancel := ods.FieldByName('GET_NAZCANCEL').AsInteger;
    get_vipnaz := ods.FieldByName('GET_VIPNAZ').AsInteger;
    get_nazplan := ods.FieldByName('GET_NAZPLAN').AsInteger;
    get_nevip := ods.FieldByName('GET_NEVIP').AsInteger;
   	get_recomend := ods.FieldByName('GET_RECOMEND').AsInteger;
    get_konsid := ods.FieldByName('GET_KONSID').AsInteger;
   	get_systemdate := ods.FieldByName('SYSTEMDATE').AsDateTime;
    get_dbname := ods.FieldByName('DB_NAME').AsString;
    use_odslist_only_raspis := udbTableutils.TDBUtils.GetConstantDef('use_odslist_only_raspis', os, -1);
    list_konsult_only_diagnazprint := udbTableutils.TDBUtils.GetConstantDef('list_konsult_only_diagnazprint', os, 0); //ods.FieldByName('list_konsult_only_diagnazprint').AsInteger;
    list_visible_row_allkabinet := TDBUtils.GetConstantDef('list_visible_row_allkabinet', os, 0);
    DOP_DISP_OTDEL := TDBUtils.GetConstantDef('DOP_DISP_OTDEL', os, 0);
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.DoResultHTML(nNazID, nPacID: Integer; IS_GET_HTM_OSM: Boolean = False);
var oq : TOracleDataSet;
    ods : TOracleDataSet;
    LOB : TLOBLocator;
    IDRes : Integer;
    RegSave, RegLoad : TRegIniFile;
begin
  Application.CreateForm(TfrmPreview, frmPreview);
  RegLoad := TRegIniFile.Create;
  ods := TOracleDataSet.Create(nil);
  oq := TOracleDataSet.Create(nil);
  lob := TLOBLocator.Create(os, otCLOB);
  try
    RegLoad.RootKey := HKEY_CURRENT_USER;
    RegLoad.OpenKey('\Software\Softmaster\Print\ID_VRACH'+IntToStr(pSotrID), True);
    frmPreview.bbFormat.ItemIndex := RegLoad.ReadInteger('\Software\Softmaster\Print\ID_VRACH'+IntToStr(pSOTRID), 'RazmerList', 0);
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT FK_ID FROM asu.VRES WHERE FK_NAZID = :pfk_nazid ';
    ods.DeclareAndSet('pfk_nazid', otInteger, nNazID);
    ods.Open;
    IDRes := ods.FieldByName('FK_ID').AsInteger;
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' SELECT THTMLIMAGES.FC_NAME||''.JPG'' SFILENAME, THTMLIMAGES.FB_BLOB '+#13+
                    '   FROM ASU.TRICHVIEWDATA, ASU.THTMLIMAGES '+#13+
                    '  WHERE TRICHVIEWDATA.FK_PACID = :pfk_pacid '+#13+
                    '    AND THTMLIMAGES.FK_RICHVIEW = TRICHVIEWDATA.FK_ID ';
    ods.DeclareAndSet('pfk_pacid', otInteger, nNazID);
    ods.Open;
    if ods.RecordCount > 0 then
      begin
        while not ods.Eof do
          begin
            TBlobField(ods.FieldByName('FB_BLOB')).SaveToFile(ExtractFilePath(paramstr(0))+ods.FieldByName('SFILENAME').AsString);
            BmpToJPEG(ods.FieldByName('SFILENAME').AsString, ods.FieldByName('SFILENAME').AsString);
            ods.Next;
          end;
      end;

    oq.Session:=os;
    oq.Cursor := crSQLWait;
    oq.DeclareVariable('html', otCLOB);
    oq.SetComplexVariable('html', LOB);
    oq.SQL.Add(' begin ');
    oq.SQL.Add('  dbms_lob.createtemporary(:html, True, dbms_lob.SESSION); ');
    oq.SQL.Add('  dbms_lob.WRITE(:html,1,1,'' ''); ');

    if IS_GET_HTM_OSM
    then oq.SQL.Add('  :html := STAT.PKG_IBXML.GET_HTM_OSM('+IntToStr(IDRes)+'); ')
    else oq.SQL.Add('  :html := asu.GET_HTM_OSM_KOLYA('+IntToStr(IDRes)+', :pBase); ');

    oq.SQL.Add(' end; ');

    if not IS_GET_HTM_OSM
    then oq.DeclareAndSet('pBase', otString, get_dbname);

    oq.Open;

    lob := TLOBLocator(oq.GetComplexVariable('html'));
    lob.SaveToFile(ExtractFilePath(paramstr(0))+inttostr(nPacID) +'print.htm');
    frmPreview.wb.Navigate(ExtractFilePath(paramstr(0))+inttostr(nPacID) +'print.htm');
    frmPreview.ShowModal;
    if frmPreview.ModalResult = MrOk then
      begin
        RegSave := TRegIniFile.Create;
        RegSave.RootKey:=HKEY_CURRENT_USER;
        if not RegSave.OpenKey('\Software\Softmaster\Print\', FALSE) then
          begin
            RegSave.CreateKey('\Software\Softmaster\Print');
          end;
        try
          RegSave.WriteInteger('\Software\Softmaster\Print\ID_VRACH'+IntToStr(pSotrID), 'RazmerList', frmPreview.bbFormat.ItemIndex);
        except
        end;
        RegSave.Free;
        DoPrintDocument(ExtractFilePath(paramstr(0))+inttostr(nPacID) +'print.htm', frmPreview.bbFormat.ItemIndex);
        try
          DeleteFile(ExtractFilePath(paramstr(0))+inttostr(nPacID) +'print.htm');
          ods.First;
          while not ods.Eof do
            begin
              DeleteFile(ExtractFilePath(paramstr(0))+ods.FieldByName('SFILENAME').AsString);
              ods.Next;
            end;
        except
        end;
      end else
      begin
        try
          DeleteFile(ExtractFilePath(paramstr(0))+inttostr(nPacID) +'print.htm');
          ods.First;
          while not ods.Eof do
            begin
              DeleteFile(ExtractFilePath(paramstr(0))+ods.FieldByName('SFILENAME').AsString);
              ods.Next;
            end;
        except
        end;
      end;
  finally
    RegLoad.Free;
    ods.Free;
    oq.Free;
    lob.Free;
    frmPreview.Free;
  end;
end;

procedure TfrmMain.aAddQExecute(Sender: TObject);
var hDll : THandle;
    InitPluginQ : TInitPluginQ;
begin
  hDLL := LoadLibrary('dll_HospitalQueue.dll');
  try
    if (hDLL <> 0) then
      begin
        @InitPluginQ := GetProcAddress(hDLL, 'InitPlugin');
        if (@InitPluginQ = nil) then
          begin
            Application.MessageBox('Функция InitPlugin не найдена в dll_HospitalQueue.dll', 'Внимание', MB_OK + MB_ICONEXCLAMATION);
          end else
          begin
            try
              InitPluginQ(Application.Handle, Self.Handle, 1, pSotrID, dsList.DataSet.FieldByName('peplid').AsInteger);
            except
            on E : Exception do begin
              Application.MessageBox(PChar('Ошибка при запуске внешнего модуля dll_HospitalQueue.dll' + #10 + #13 + E.Message), 'Ошибка', MB_OK + MB_ICONERROR);
            end;
            end;
          end;
      end else
      begin
        Application.MessageBox('Библиотека dll_HospitalQueue.dll не найдена', 'Внимание', MB_OK + MB_ICONEXCLAMATION);
      end;
  finally
    FreeLibrary(hDLL);
  end;
end;

procedure TfrmMain.aArchiveExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmArchive, frmArchive);
  try
    frmArchive.DoShowForm;
    frmArchive.ShowModal;
  finally
    frmArchive.Free;
  end;
end;

procedure TfrmMain.aBackQExecute(Sender: TObject);
var hDll : THandle;
    InitPluginQ : TInitPluginQ;
begin
  hDLL := LoadLibrary('dll_HospitalQueue.dll');
  try
    if (hDLL <> 0) then
      begin
        @InitPluginQ := GetProcAddress(hDLL, 'InitPlugin');
        if (@InitPluginQ = nil) then
          begin
            Application.MessageBox('Функция InitPlugin не найдена в dll_HospitalQueue.dll', 'Внимание', MB_OK + MB_ICONEXCLAMATION);
          end else
          begin
            try
              InitPluginQ(Application.Handle, Self.Handle, 4, pSotrID, dsList.DataSet.FieldByName('peplid').AsInteger);
            except
            on E : Exception do begin
              Application.MessageBox(PChar('Ошибка при запуске внешнего модуля dll_HospitalQueue.dll' + #10 + #13 + E.Message), 'Ошибка', MB_OK + MB_ICONERROR);
            end;
            end;
          end;
      end else
      begin
        Application.MessageBox('Библиотека dll_HospitalQueue.dll не найдена', 'Внимание', MB_OK + MB_ICONEXCLAMATION);
      end;
  finally
    FreeLibrary(hDLL);
  end;
end;

procedure TfrmMain.aBeremExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select fp_sex from asu.tpeoples where fk_id = :pfk_id ';
    ods.DeclareAndSet('pfk_id', otInteger, dsList.DataSet.FieldByName('peplid').AsInteger);
    ods.Open;
    if ods.FieldByName('fp_sex').AsInteger = 1 then
      begin
        Application.MessageBox('На учёт по беременности можно поставить только пациента женского пола!', 'Внимание', mb_ok+mb_iconinformation);
        exit;
      end;
    if dsList.DataSet.FieldByName('is_amb').AsInteger = 0 then
      begin
        Application.MessageBox('На учёт по беременности можно поставить только амбулаторного пациента!', 'Внимание', mb_ok+mb_iconinformation);
        exit;
      end;
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' select count(*) as cnt '+#13+
                    '   from asu.tambulance t1, asu.tdocobsl t2 '+#13+
                    '  where t1.fk_docobsl = t2.fk_id '+#13+
                    '    and t2.fk_viddocid = asu.DOC_INDIVID_KARTA_BER '+#13+
                    '    and t1.fl_vyb = 0 '+#13+
                    '    and t1.fk_peplid = :pfk_peplid ';
    ods.DeclareAndSet('pfk_peplid', otInteger, dsList.DataSet.FieldByName('peplid').AsInteger);
    ods.Open;
    if ods.FieldByName('cnt').AsInteger > 0 then
      begin
        Application.MessageBox('Внимание!'+#13+
                               'У данного пациента уже зарегистрирован документ "Индивидуальная карта беременной"!',
                               'Информация', mb_ok+mb_iconinformation);
        exit;
      end;
//-- регистрируем новую карту
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' declare '+#13+
                    '   pDocObslId number; '+#13+
                    '   pNum varchar2(100); '+#13+
                    '   vfk_peplid number; '+#13+
                    '   vfc_fam varchar2(300); '+#13+
                    '   vfc_im varchar2(100); '+#13+
                    '   vfc_otch varchar2(100); '+#13+
                    '   vfd_rojd date; '+#13+
                    '   vfp_sex number; '+#13+
                    '   cursor cAmb is select fk_peplid, fc_fam, fc_im, fc_otch, fd_rojd, fp_sex from asu.tambulance where fk_id = :pfk_id; '+#13+
                    ' begin '+#13+
                    '   pDocObslId := asu.set_newibnum(asu.DOC_INDIVID_KARTA_BER, pNum); '+#13+
                    '   open cAmb; '+#13+
                    '   fetch cAmb into vfk_peplid, vfc_fam, vfc_im, vfc_otch, vfd_rojd, vfp_sex; '+#13+
                    '   close cAmb; '+#13+
                    '   insert into asu.tambulance '+#13+
                    '   (fk_ibid, fk_iby, fc_fam, fc_im, fc_otch, fd_rojd, fp_sex, fk_peplid, fk_docobsl)'+#13+
                    '   values '+#13+
                    '   (pNum, asu.get_yearwork, vfc_fam, vfc_im, vfc_otch, vfd_rojd, vfp_sex, vfk_peplid, pDocObslId); '+#13+
                    ' end; ';
    ods.DeclareAndSet('pfk_id', otInteger, dsList.DataSet.FieldByName('fk_pacid').AsInteger);
    ods.Open;
    os.Commit;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.aCancelExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmNeyav, frmNeyav);
  try
    frmNeyav.ShowModal;
    if frmNeyav.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' UPDATE asu.VNAZ SET FK_ISPOLID = :pFK_ISPOLID, FK_NAZSOSID = :pFK_NAZSOSID WHERE FK_ID = :pFK_ID ';
          oq.DeclareAndSet('pFK_ISPOLID', otInteger, pSOTRID);
          oq.DeclareAndSet('pFK_NAZSOSID', otInteger, GET_NAZCANCEL);
          oq.DeclareAndSet('pFK_ID', otInteger, dsList.DataSet.FieldByName('FK_ID').AsInteger);
          oq.Execute;
          oq.DeleteVariables;
          oq.SQL.Text := ' INSERT INTO asu.VRES(FK_SMID, FD_INS, FC_RES, FC_TYPE, FK_VRACHID, FK_PACID, FK_NAZID, FK_SOS) '+#13+
                         ' VALUES(:pFK_SMID, SYSDATE, :PFC_RES, ''TEXT'', :pFK_VRACHID, :pFK_PACID, :pFK_NAZID, :pFK_SOS) ';
          oq.DeclareAndSet('pFK_SMID', otInteger, dsList.DataSet.FieldByName('FK_SMID').AsInteger);
          oq.DeclareAndSet('pFK_VRACHID', otInteger, pSOTRID);
          oq.DeclareAndSet('pFK_PACID', otInteger, dsList.DataSet.FieldByName('FK_PACID').AsInteger);
          oq.DeclareAndSet('pFK_NAZID', otInteger, dsList.DataSet.FieldByName('FK_ID').AsInteger);
          oq.DeclareAndSet('pFK_SOS', otInteger, GET_NAZCANCEL);
          oq.DeclareAndSet('pFC_RES', otString, frmNeyav.memReason.Text);
          oq.Execute;
          oq.DeleteVariables;
          oq.SQL.Text := ' INSERT INTO asu.TIB(FC_CHAR, FK_PACID, FK_SMID, FK_SMEDITID, FK_VRACHID, FD_DATE) '+
                         ' VALUES(:PFC_CHAR, :pFK_PACID, '+
                         '        (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''XRAY_OTMENA_NEYVKA''), '+
                         '        (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''GET_OTKAZ_RG_ISSL''), '+
                         '        :pFK_VRACHID, SYSDATE) ' ;
          oq.DeclareAndSet('PFC_CHAR', otString, frmNeyav.memReason.Text);
          oq.DeclareAndSet('pFK_PACID', otInteger, dsList.DataSet.FieldByName('FK_ID').AsInteger);
          oq.DeclareAndSet('pFK_VRACHID', otInteger, pSOTRID);
          oq.Execute;
          frmMain.os.Commit;
          RefreshQuery(dsList.DataSet);
        finally
          oq.Free;
        end;
      end;
  finally
    frmNeyav.Free;
  end;
end;

procedure TfrmMain.odsListAfterScroll(DataSet: TDataSet);
begin
  CheckEnabledButons;
end;

procedure TfrmMain.odsListAllAfterScroll(DataSet: TDataSet);
begin
  CheckEnabledButons;
end;

procedure TfrmMain.CheckEnabledButons;
begin
  aInfo.Enabled := (dsList.DataSet.RecordCount <> 0);
  aOpen.Enabled := dsList.DataSet.RecordCount <> 0;
  aFill.Enabled := (dsList.DataSet.RecordCount <> 0)
                    and ((dsList.DataSet.FieldByName('FK_NAZSOSID').AsInteger = GET_NEVIP) or (dsList.DataSet.FieldByName('FK_NAZSOSID').AsInteger = GET_RECOMEND));
  aCancel.Enabled := (dsList.DataSet.RecordCount <> 0)
                      and ((dsList.DataSet.FieldByName('FK_NAZSOSID').AsInteger = GET_NEVIP) or (dsList.DataSet.FieldByName('FK_NAZSOSID').AsInteger = GET_RECOMEND));
  aEdit.Enabled := (dsList.DataSet.RecordCount <> 0)
                   and (dsList.DataSet.FieldByName('FK_NAZSOSID').AsInteger = GET_VIPNAZ)
                   and (dsList.DataSet.FieldByName('FK_NAZSOSID').AsInteger <> GET_NAZCANCEL)
                   and (pSOTRID = dsList.DataSet.FieldByName('FK_ISPOLID').AsInteger);
  aPrint.Enabled := dsList.DataSet.RecordCount <> 0;
  aProsmotr.Enabled := dsList.DataSet.FieldByName('FK_NAZSOSID').AsInteger = GET_VIPNAZ;
  aPac.Enabled := dsList.DataSet.RecordCount <> 0;
  aBerem.Enabled := dsList.DataSet.RecordCount <> 0;
  aOnko.Enabled := dsList.DataSet.RecordCount <> 0;  
  aCopyFIO.Enabled := dsList.DataSet.RecordCount <> 0;
  aMs.Enabled := dsList.DataSet.RecordCount <> 0;
//  aMs.Visible := get_dbname = 'SK';
  aAddQ.Enabled := dsList.DataSet.RecordCount <> 0;
  aEditQ.Enabled := dsList.DataSet.RecordCount <> 0;
  aDelQ.Enabled := dsList.DataSet.RecordCount <> 0;
  aBackQ.Enabled := dsList.DataSet.RecordCount <> 0;
end;

procedure TfrmMain.TVKabCustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  try
    if AViewInfo.GridRecord.Values[grdbtvID.index] = -1 then
     ACanvas.Font.Style := ACanvas.Font.Style + [fsBold]; 
  except
  end;
end;

procedure TfrmMain.TVListCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var ods : TOracleDataSet;
begin
	if dsList.DataSet.RecordCount <> 0 then
	begin
	if dsList.DataSet.FieldByName('FK_NAZSOSID').AsInteger = GET_NAZCANCEL then
		begin
			Application.CreateForm(TfrmOtmena, frmOtmena);
			frmOtmena.acOk.Visible := FALSE;
      frmOtmena.GroupBox1.Visible := FALSE;
      frmOtmena.cxOtmena.Align := alClient;
      frmOtmena.cxOtmena.Enabled := False;
      frmOtmena.acCancel.ImageIndex := 2;
			frmOtmena.acCancel.Caption := 'Закрыть';
      frmOtmena.Caption := 'Обоснование отмены (просмотр)';
			ods := TOracleDataSet.Create(nil);
			try
				ods.Session := os;
				ods.Cursor := crSQLWait;
				ods.SQL.Text := ' SELECT FC_RES, FD_INS, FK_VRACHID, ASU.DO_VRACHFIO(FK_VRACHID) AS VRACHFIO '+
                        '   FROM VRES WHERE FK_NAZID = :pFK_NAZID AND FK_SOS = GET_NAZCANCEL ';
				ods.DeclareAndSet('pFK_NAZID', otInteger, dsList.DataSet.FieldByName('FK_ID').AsInteger);
				ods.Open;
				frmOtmena.cxOtmena.Text := 'Сотрудник:'+' '+ods.FieldByName('VRACHFIO').AsString+','+' '+
																	 'Дата отмены:'+' '+DateTimeToStr(ods.FieldByName('FD_INS').AsDateTime)+#13#10+
																	 'Обоснование отмены:'+' '+ods.FieldByName('FC_RES').AsString;
			finally
				ods.Free;
			end;
			frmOtmena.ShowModal;
			frmOtmena.Free;
		end else
		begin
      if aFill.Visible = True then
        begin
			    if (dsList.DataSet.FieldByName('FK_NAZSOSID').AsInteger <> GET_VIPNAZ) then
				    aFillExecute(nil);
        end;
		end;
	end;
end;

procedure TfrmMain.TVListCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  if AViewInfo.GridRecord.Values[TVSOS.Index] = GET_NAZCANCEL then
    ACanvas.Brush.Color:=RGB(251, 172, 182);
  if AViewInfo.GridRecord.Values[TVFK_NAZTYPE.Index] <> GET_NAZPLAN then
    ACanvas.Font.Style := [fsBold];
  if AViewInfo.GridRecord.Values[VListCntLek.Index] > 0 then
    ACanvas.Brush.Color:=RGB(255, 255, 136);
  if AViewInfo.GridRecord.Values[VListNext_yavk.Index] = 1
  then ACanvas.Brush.Color:=RGB(177, 252, 200);
end;

//function TfrmMain.WinExecAndWait32(FileName: string; Visibility: integer): integer;
//var zAppName: array[0..512] of char;
//    zCurDir: array[0..255] of char;
//    WorkDir: string;
//    StartupInfo: TStartupInfo;
//    ProcessInfo: TProcessInformation;
//begin
//  StrPCopy(zAppName, FileName);
//  GetDir(0, WorkDir);
//  StrPCopy(zCurDir, FileName);
//  FillChar(StartupInfo, Sizeof(StartupInfo), #0);
//  StartupInfo.cb := Sizeof(StartupInfo);
//  StartupInfo.hStdInput := 23999;
//  StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
//  StartupInfo.wShowWindow := Visibility;
//  if not CreateProcess(nil,
//         zAppName, { указатель командной строки }
//         nil, { указатель на процесс атрибутов безопасности }
//         nil, { указатель на поток атрибутов безопасности }
//         false, { флаг родительского обработчика }
//         CREATE_NEW_CONSOLE or { флаг создания }
//         NORMAL_PRIORITY_CLASS,
//         nil, { указатель на новую среду процесса }
//         nil, { указатель на имя текущей директории }
//         StartupInfo, { указатель на STARTUPINFO }
//         ProcessInfo) then Result := -1 { указатель на PROCESS_INF }
//  else begin
//      Result := ProcessInfo.dwProcessId;
//  end;
//end;

procedure TfrmMain.N2Click(Sender: TObject);
begin
  TVList.RestoreFromRegistry('\SoftWare\SoftMaster\List_konsult1.1\cxGr'+'Vrach'+ '_' + IntToStr(pSOTRID)+'Default', FALSE, FALSE, [], 'cxGr');
  VListStatusKart.Visible := get_dbname = 'SK';
  VListStatusKart.Hidden := get_dbname <> 'SK';
  VListStatusTalon.Visible := get_dbname = 'SK';
  VListStatusTalon.Hidden := get_dbname <> 'SK';
end;

procedure TfrmMain.frx30GetValue(const VarName: String; var Value: Variant);
begin
  if VarName = 'D1' then Value := DateTimeToStr(DateB);
  if VarName = 'D2' then Value := DateTimeToStr(DateE);
end;

procedure TfrmMain.odsKabBeforeOpen(DataSet: TDataSet);
begin
  odsKab.SetVariable('PSOTR', pSOTRID);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  GetSession(os, 'ASU');
//  SetDesignApplication;
  russian := LoadKeyboardLayout('00000419', 0);
  Application.HelpFile := ExtractFilePath(Application.ExeName)+'Spiski.chm';
  frmMain.WindowState := wsMaximized;

  LKONS_PRINT_HTML := (uDBTableUtils.TDBUtils.GetFunctionDef('LKONS_PRINT_HTML', os, 0) = 1);
  IB_CHECK_STAC := (uDBTableUtils.TDBUtils.GetFunctionDef('IB_CHECK_STAC', os, 0) = 1);
  list_konsult_use_period := uDBTableUtils.TDBUtils.GetFunctionDef('list_konsult_use_period', os, 0);
  if list_konsult_use_period = 1 then
   dxdeDate2.Visible := ivAlways
  else
   dxdeDate2.Visible := ivNever;
end;

procedure TfrmMain.blMonClick(Sender: TObject);
var mm,yy,dd:word;
begin
  try
    dxdeDate.OnChange := nil;
    dxdeDate2.OnChange := nil;
  decodeDate(dxdeDate.EditValue,yy,mm,dd);
  if dd=31 then dd:=30;
  if ((mm=3) and (dd>28)) then dd:=28;
  if mm>1 then mm:=mm-1
   else
     begin
       mm:=12;
       yy:=yy-1;
     end;

  dxdeDate.EditValue:=encodeDate(yy,mm,dd);

    decodeDate(dxdeDate2.EditValue,yy,mm,dd);
    if dd=31 then dd:=30;
    if ((mm=3) and (dd>28)) then dd:=28;
    if mm>1 then mm:=mm-1
     else
       begin
         mm:=12;
         yy:=yy-1;
       end;

    dxdeDate2.EditValue:=encodeDate(yy,mm,dd);
  finally
    dxdeDate.OnChange := dxdeDateChange;
    dxdeDate2.OnChange := dxdeDateChange;
    dxdeDateChange(dxdedate);
  end;
end;

procedure TfrmMain.blWeeksClick(Sender: TObject);
begin
  try                                    
    dxdeDate.OnChange := nil;
    dxdeDate2.OnChange := nil;
  dxdeDate.EditValue:=dxdeDate.EditValue-1;
    dxdeDate2.EditValue:=dxdeDate2.EditValue-1;
  finally
    dxdeDate.OnChange := dxdeDateChange;
    dxdeDate2.OnChange := dxdeDateChange;
    dxdeDateChange(dxdedate);
  end;
end;

procedure TfrmMain.BmpToJPEG(pFNAME1, pFNAME2: String);
var
  JPEG: TJPEGImage;
  Bitmap: TBitmap;
  Image1: TImage;
  lStream: TFileStream;
begin
  lStream:=TFileStream.Create(ExtractFilePath(paramstr(0))+pFNAME2,fmOpenRead);
  try
    if PhysicalResolveFileType(lStream)=1 then
      begin
        lStream.Free;
        JPEG := TJPEGImage.Create;
        Bitmap := TBitmap.Create;
        Image1:=timage.create(nil);
        try
          Bitmap.LoadFromFile(ExtractFilePath(paramstr(0))+pFNAME2);
          JPEG.Assign(Bitmap);
          Image1.Picture.Assign(JPEG);
          Image1.Picture.SaveToFile(ExtractFilePath(paramstr(0))+pFNAME1);
        finally
          Image1.free;
          JPEG.Free;
          Bitmap.Free;
        end;
      end
      else
          lStream.Free;
  except
    lStream.Free;
  end;
end;

procedure TfrmMain.p1Click(Sender: TObject);
var wd:integer;
begin
  try
    dxdeDate.OnChange := nil;
    dxdeDate2.OnChange := nil;
  wd:=dayofweek(dxdeDate.EditValue);
  if wd=1 then wd:=8;
  dxdeDate.EditValue:=dxdeDate.EditValue-wd+2;
    wd:=dayofweek(dxdeDate2.EditValue);
    if wd=1 then wd:=8;
    dxdeDate2.EditValue:=dxdeDate2.EditValue-wd+2;
  finally
    dxdeDate.OnChange := dxdeDateChange;
    dxdeDate2.OnChange := dxdeDateChange;
    dxdeDateChange(dxdedate);
  end;
end;

procedure TfrmMain.p2Click(Sender: TObject);
var
 wd:integer;
begin
  try
    dxdeDate.OnChange := nil;
    dxdeDate2.OnChange := nil;
  wd:=dayofweek(dxdeDate.EditValue);
  if wd=1 then wd:=8;
  dxdeDate.EditValue:=dxdeDate.EditValue-wd+3;
    wd:=dayofweek(dxdeDate2.EditValue);
    if wd=1 then wd:=8;
    dxdeDate2.EditValue:=dxdeDate2.EditValue-wd+3;
  finally
    dxdeDate.OnChange := dxdeDateChange;
    dxdeDate2.OnChange := dxdeDateChange;
    dxdeDateChange(dxdedate);
  end;
end;

procedure TfrmMain.p3Click(Sender: TObject);
var wd:integer;
begin
  try
    dxdeDate.OnChange := nil;
    dxdeDate2.OnChange := nil;
  wd:=dayofweek(dxdeDate.EditValue);
  if wd=1 then wd:=8;
    dxdeDate.EditValue:=dxdeDate.EditValue-wd+4;   
    wd:=dayofweek(dxdeDate2.EditValue);
    if wd=1 then wd:=8;
    dxdeDate2.EditValue:=dxdeDate2.EditValue-wd+4;
  finally
    dxdeDate.OnChange := dxdeDateChange;
    dxdeDate2.OnChange := dxdeDateChange;
    dxdeDateChange(dxdedate);
  end;
end;

procedure TfrmMain.p4Click(Sender: TObject);
var wd:integer;
begin
  try
    dxdeDate.OnChange := nil;
    dxdeDate2.OnChange := nil;
  wd:=dayofweek(dxdeDate.EditValue);
  if wd=1 then wd:=8;
    dxdeDate.EditValue:=dxdeDate.EditValue-wd+5; 
    wd:=dayofweek(dxdeDate2.EditValue);
    if wd=1 then wd:=8;
    dxdeDate2.EditValue:=dxdeDate2.EditValue-wd+5;
  finally
    dxdeDate.OnChange := dxdeDateChange;
    dxdeDate2.OnChange := dxdeDateChange;
    dxdeDateChange(dxdedate);
  end;
end;

procedure TfrmMain.p5Click(Sender: TObject);
var wd:integer;
begin
  try
    dxdeDate.OnChange := nil;
    dxdeDate2.OnChange := nil;
  wd:=dayofweek(dxdeDate.EditValue);
  if wd=1 then wd:=8;
    dxdeDate.EditValue:=dxdeDate.EditValue-wd+6;   
    wd:=dayofweek(dxdeDate2.EditValue);
    if wd=1 then wd:=8;
    dxdeDate2.EditValue:=dxdeDate2.EditValue-wd+6;
  finally
    dxdeDate.OnChange := dxdeDateChange;
    dxdeDate2.OnChange := dxdeDateChange;
    dxdeDateChange(dxdedate);
  end;
end;

procedure TfrmMain.p6Click(Sender: TObject);
var wd:integer;
begin                   
  try
    dxdeDate.OnChange := nil;
    dxdeDate2.OnChange := nil;
  wd:=dayofweek(dxdeDate.EditValue);
  if wd=1 then wd:=8;
    dxdeDate.EditValue:=dxdeDate.EditValue-wd+7;  
    wd:=dayofweek(dxdeDate2.EditValue);
    if wd=1 then wd:=8;
    dxdeDate2.EditValue:=dxdeDate2.EditValue-wd+7;
  finally
    dxdeDate.OnChange := dxdeDateChange;
    dxdeDate2.OnChange := dxdeDateChange;
    dxdeDateChange(dxdedate);
  end;
end;

procedure TfrmMain.p7Click(Sender: TObject);
var wd:integer;
begin                        
  try
    dxdeDate.OnChange := nil;
    dxdeDate2.OnChange := nil;
  wd:=dayofweek(dxdeDate.EditValue);
  if wd=1 then wd:=8;
    dxdeDate.EditValue:=dxdeDate.EditValue-wd+8; 
    wd:=dayofweek(dxdeDate2.EditValue);
    if wd=1 then wd:=8;
    dxdeDate2.EditValue:=dxdeDate2.EditValue-wd+8;
  finally
    dxdeDate.OnChange := dxdeDateChange;
    dxdeDate2.OnChange := dxdeDateChange;
    dxdeDateChange(dxdedate);
  end;
end;

function TfrmMain.PhysicalResolveFileType(AStream: TStream): Integer;
var p: PChar;
begin
  Result := 0;
  if not Assigned(AStream) then
    Exit;
  GetMem(p, 10);
  try
    AStream.Position := 0;
    AStream.Read(p[0], 10);
    {bitmap format}
    if (p[0] = #66) and (p[1] = #77) then
      Result := 1;
    {tiff format}
    if ((p[0] = #73) and (p[1] = #73) and (p[2] = #42) and (p[3] = #0)) or
      ((p[0] = #77) and (p[1] = #77) and (p[2] = #42) and (p[3] = #0)) then
      Result := 2;
    {jpg format}
    if (p[6] = #74) and (p[7] = #70) and (p[8] = #73) and (p[9] = #70) then
      Result := 3;
    {png format}
    if (p[0] = #137) and (p[1] = #80) and (p[2] = #78) and (p[3] = #71) and
      (p[4] = #13) and (p[5] = #10) and (p[6] = #26) and (p[7] = #10) then
      Result := 4;
    {dcx format}
    if (p[0] = #177) and (p[1] = #104) and (p[2] = #222) and (p[3] = #58) then
      Result := 5;
    {pcx format}
    if p[0] = #10 then
      Result := 6;
    {emf format}
    if (p[0] = #215) and (p[1] = #205) and (p[2] = #198) and (p[3] = #154) then
      Result := 7;
    {emf format}
    if (p[0] = #1) and (p[1] = #0) and (p[2] = #0) and (p[3] = #0) then
      Result := 7;
  finally
    Freemem(p);
  end;
end;

function TfrmMain.RestoreApplication(AAppCaption: string): Boolean;
var
  Wnd               : hWnd;
  buff              : array[0..127] of Char;
begin
  Result := False;
  Self.SetFocus;
  Application.ProcessMessages;
  Wnd := GetWindow(Handle, gw_HWndFirst);
  while Wnd <> 0 do
  begin
    if (Wnd <> Application.Handle) and (GetWindow(Wnd, gw_Owner) = 0) then
    begin
      GetWindowText(Wnd, buff, sizeof(buff));
      if StrPas(buff) = AAppCaption then
      begin
        Application.ProcessMessages;
        ShowWindow(wnd, SW_SHOWMINIMIZED);
        ShowWindow(wnd, SW_SHOWNORMAL);
        SetForegroundWindow(wnd);
        Application.ProcessMessages;
        Result := True;
        Exit;
      end; //if StrPas(buff) = cFIO
    end; //if (Wnd <> Application.Handle) and (GetWindow(Wnd, gw_Owner) = 0) then
    Wnd := GetWindow(Wnd, gw_hWndNext);
  end; //while Wnd <> 0
end;

procedure TfrmMain.rListMGRGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := sOtdelName_4Rep;
  if VarName = 'KAB' then Value := odsKab.FieldByName('FC_NAME').AsString;
  if VarName = 'DATENOW' then Value := VarToDateTime(dxdeDate.EditValue);
  if VarName = 'SYSDATE' then Value := GET_SYSDATE_4REP;
  if VarName = 'MEDOTRADESIGN' then Value := MedotradeSign;
end;

procedure TfrmMain.brWeeksClick(Sender: TObject);
begin
  try
    dxdeDate.OnChange := nil;
    dxdeDate2.OnChange := nil;
  dxdeDate.EditValue:=dxdeDate.EditValue+1;
    dxdeDate2.EditValue:=dxdeDate2.EditValue+1;
  finally
    dxdeDate.OnChange := dxdeDateChange;
    dxdeDate2.OnChange := dxdeDateChange;
    dxdeDateChange(dxdedate);
  end;
end;

procedure TfrmMain.brMonClick(Sender: TObject);
var yy,mm,dd:word;
begin                      
  try
    dxdeDate.OnChange := nil;
    dxdeDate2.OnChange := nil;
  decodeDate(dxdeDate.EditValue,yy,mm,dd);
  if dd=31 then dd:=30;
  if ((mm=1) and (dd>28)) then dd:=28;
  if mm<12 then mm:=mm+1
   else
     begin
       mm:=1;
       yy:=yy+1;
     end;
    dxdeDate.EditValue:=encodeDate(yy,mm,dd); 
    decodeDate(dxdeDate2.EditValue,yy,mm,dd);
    if dd=31 then dd:=30;
    if ((mm=1) and (dd>28)) then dd:=28;
    if mm<12 then mm:=mm+1
     else
       begin
         mm:=1;
         yy:=yy+1;
       end;
    dxdeDate2.EditValue:=encodeDate(yy,mm,dd);
  finally
    dxdeDate.OnChange := dxdeDateChange;
    dxdeDate2.OnChange := dxdeDateChange;
    dxdeDateChange(dxdedate);
  end;
end;

procedure TfrmMain.DateChange;
var yy,mm,dd : word;
    wd : integer;
begin
  pMonth.Caption:=FormatDateTime('mmmm',dxdeDate.EditValue)+', '+(FormatDateTime('dddd',dxdeDate.EditValue));

  wd:=dayofweek(dxdeDate.EditValue);
  if wd=1 then wd:=8;

  decodeDate(dxdeDate.EditValue-wd+2,yy,mm,dd);
  p1.Caption:=inttostr(dd);

  decodeDate(dxdeDate.EditValue-wd+3,yy,mm,dd);
  p2.Caption:=inttostr(dd);

  decodeDate(dxdeDate.EditValue-wd+4,yy,mm,dd);
  p3.Caption:=inttostr(dd);

  decodeDate(dxdeDate.EditValue-wd+5,yy,mm,dd);
  p4.Caption:=inttostr(dd);

  decodeDate(dxdeDate.EditValue-wd+6,yy,mm,dd);
  p5.Caption:=inttostr(dd);

  decodeDate(dxdeDate.EditValue-wd+7,yy,mm,dd);
  p6.Caption:=inttostr(dd);

  decodeDate(dxdeDate.EditValue-wd+8,yy,mm,dd);
  p7.Caption:=inttostr(dd);

  p1.Color:=clCream;
  p2.Color:=clCream;
  p3.Color:=clCream;
  p4.Color:=clCream;
  p5.Color:=clCream;
  p6.Color:=clCream;
  p7.Color:=clCream;
  case wd-1 of
    1:p1.Color:=clSkyBlue;
    2:p2.Color:=clSkyBlue;
    3:p3.Color:=clSkyBlue;
    4:p4.Color:=clSkyBlue;
    5:p5.Color:=clSkyBlue;
    6:p6.Color:=clSkyBlue;
    7:p7.Color:=clSkyBlue;
  end;
end;

procedure TfrmMain.aInfoExecute(Sender: TObject);
begin
  if not DoShowConfidencial(dsList.DataSet.FieldByName('FK_PACID').AsInteger, PSOTRID) then
  begin
    Application.CreateForm(TfrmPacInfoKonsult, frmPacInfoKonsult);
    try
      frmPacInfoKonsult.DoShowPacInfo(dsList.DataSet.FieldByName('FK_PACID').AsInteger,
                                      dsList.DataSet.FieldByName('PEPLID').AsInteger,
                                      dsList.DataSet.FieldByName('VRACHFIO').AsString);
      frmPacInfoKonsult.ShowModal;
      if frmPacInfoKonsult.isEdit = True then // если были изменения в лекарственной непереносимости, то обновляем список консультаций
        RefreshQuery(dsList.DataSet);
    finally
      frmPacInfoKonsult.Free;
    end;
  end;
end;

procedure TfrmMain.aMSExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  Application.CreateForm(TfrmSetMs, frmSetMs);
  ods := TOracleDataSet.Create(nil);
  ods.Session := os;
  ods.Cursor := crSqlWait;
  try
    ods.SQL.Text := ' select fn_num, asu.do_vrachfio(fn_num) as sotrfio '+#13+
                    '   from asu.tib '+#13+
                    '  where fk_pacid = :pfk_pacid and fk_smid = (select fk_id from asu.tsmid where fc_synonim = ''DIAGNOSTIC_MS'') ';
    ods.DeclareAndSet('pfk_pacid', otInteger, dsList.DataSet.FieldByName('fk_id').AsInteger);
    ods.Open;
    if ods.RecordCount > 0 then
      begin
        frmSetMs.beMs.Text := ods.FieldByName('sotrfio').AsString;
        frmSetMs.beMs.Tag := ods.FieldByName('fn_num').AsInteger;
      end;
    frmSetMs.ShowModal;
    if frmSetMs.ModalResult = mrOk then
      begin
        ods.DeleteVariables;
        ods.Close;
        ods.SQL.Text := ' merge into asu.tib '+#13+
                        '  using dual on (fk_pacid = :pfk_pacid and fk_smid = (select fk_id from asu.tsmid where fc_synonim = ''DIAGNOSTIC_MS'')) '+#13+
                        ' when matched then update set fn_num = :pfn_num, fk_vrachid = :pfk_vrachid '+#13+
                        '                    where fk_pacid = :pfk_pacid '+#13+
                        '                      and fk_smid = (select fk_id from asu.tsmid where fc_synonim = ''DIAGNOSTIC_MS'') '+#13+
                        ' when not matched then insert(fk_pacid, fn_num, fk_smid, fk_smeditid, fk_vrachid) '+#13+
                        '                       values(:pfk_pacid, :pfn_num, (select fk_id from asu.tsmid where fc_synonim = ''DIAGNOSTIC_MS''), '+#13+
                        '                                                    (select fk_owner from asu.tsmid where fc_synonim = ''DIAGNOSTIC_MS''), '+#13+
                        '                              :pfk_vrachid) ';
        ods.DeclareAndSet('pfk_pacid', otInteger, dsList.DataSet.FieldByName('fk_id').AsInteger);
        ods.DeclareAndSet('pfn_num', otInteger, frmSetMs.beMs.Tag);
        ods.DeclareAndSet('pfk_vrachid', otInteger, pSOTRID);
        ods.Open;
        frmMain.os.Commit;
      end;
  finally
    ods.Free;
    frmSetMs.Free;
  end;
end;

procedure TfrmMain.aEditExecute(Sender: TObject);
var
  ods : TOracleDataSet;
  ErrStr: String;
begin
  if (get_dbname <> 'SO') and (get_dbname <> 'PP') then // для Сургут ОКБ, ЕМНЦ ПП Екатеринбург
    begin
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := os;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' select sysdate - fd_date as raz, to_char(fd_date, ''dd.mm.yyyy hh24:mi'') as fd_date_str '+#13+
                        '   from asu.tpodpisnaz '+#13+
                        '  where fk_nazid = :pfk_nazid and fk_sos = asu.get_vipnaz ';
        ods.DeclareAndSet('pfk_nazid', otInteger, dsList.DataSet.FieldByName('fk_id').AsInteger);
        ods.Open;
        if get_dbname = 'SK' then
          begin
            if ods.FieldByName('raz').AsInteger > 31 then
              begin
                MessageDlg('С момента первой подписи консультации прошло более 31 суток! Изменить протокол консультации невозможно!'
                           +#13+#10+
                           'Дата первого подписания:'+ods.FieldByName('fd_date_str').AsString,
                           mtWarning,
                           [mbOK],
                           0);
                exit;
              end;
          end else
          begin
            if ods.FieldByName('raz').AsInteger > 1 then
              begin
                MessageDlg('С момента первой подписи консультации прошло более суток! Изменить протокол консультации невозможно!'
                           +#13+#10+
                           'Дата первого подписания:'+ods.FieldByName('fd_date_str').AsString,
                           mtWarning,
                           [mbOK],
                           0);
                exit;
              end;
          end;
      finally
        ods.Free;
      end;
    end;

  if IB_CHECK_STAC
  then begin
    if IsAmbulance(frmMain.os, dsList.DataSet.FieldByName('FK_PACID').AsInteger)
    then begin
      ErrStr := '';

      if not CheckStac(frmMain.os, dsList.DataSet.FieldByName('FK_PACID').AsInteger, ErrStr)
      then begin
        if Application.MessageBox(PAnsiChar(ErrStr + #13#10 +
          'Вы хотите редактировать данный осмотр?'), 'Внимание', MB_YESNO + MB_ICONQUESTION) = mrNo
        then begin
          exit;
        end;
      end;
    end;
  end;

  HandleDLL := 0;
  HandleDLL := LoadLibrary('PriemDll.dll');

  if HandleDLL > 0
  then begin
    try
      EditPlugin_Personal := GetProcAddress(HandleDLL, 'EditPlugin_Personal');
      FreePlugin_Priem := GetProcAddress(HandleDLL, 'FreePlugin');

      if @EditPlugin_Personal <> nil
      then begin
        try
          EditPlugin_Personal(Panel1.Handle, //хэндл панели
															Application.Handle, //хэндл аппликейшена
															dsList.DataSet.FieldByName('FK_PACID').AsInteger, //код пациента
															pSOTRID, //код сотрудника
															pAPPSOTRID, //специализация
															-1, //секция
															dsList.DataSet.FieldByName('FK_SMID').AsInteger, //смид
															dsList.DataSet.FieldByName('FK_ID').AsInteger, //назид
															FALSE,
															dsList.DataSet.FieldByName('FK_ID').AsInteger, //ид объекта
															Panel1.Parent.Handle);

          if @FreePlugin_Priem <> nil
          then FreePlugin_Priem;
        except
        end;
      end;
    finally
      Application.ProcessMessages;
      FreeLibrary(HandleDLL);
      HandleDll:=0;
    end;
  end;

  RefreshQuery(dsList.DataSet);
end;

procedure TfrmMain.aEditQExecute(Sender: TObject);
var hDll : THandle;
    InitPluginQ : TInitPluginQ;
begin
  hDLL := LoadLibrary('dll_HospitalQueue.dll');
  try
    if (hDLL <> 0) then
      begin
        @InitPluginQ := GetProcAddress(hDLL, 'InitPlugin');
        if (@InitPluginQ = nil) then
          begin
            Application.MessageBox('Функция InitPlugin не найдена в dll_HospitalQueue.dll', 'Внимание', MB_OK + MB_ICONEXCLAMATION);
          end else
          begin
            try
              InitPluginQ(Application.Handle, Self.Handle, 2, pSotrID, dsList.DataSet.FieldByName('peplid').AsInteger);
            except
            on E : Exception do begin
              Application.MessageBox(PChar('Ошибка при запуске внешнего модуля dll_HospitalQueue.dll' + #10 + #13 + E.Message), 'Ошибка', MB_OK + MB_ICONERROR);
            end;
            end;
          end;
      end else
      begin
        Application.MessageBox('Библиотека dll_HospitalQueue.dll не найдена', 'Внимание', MB_OK + MB_ICONEXCLAMATION);
      end;
  finally
    FreeLibrary(hDLL);
  end;
end;

procedure TfrmMain.aSearchExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmSearch, frmSearch);
  try
    frmSearch.DoShowfrmSearch;
    frmSearch.ShowModal;
    RefreshQuery(dsList.DataSet);
  finally
    frmSearch.Free;
  end;
end;

procedure TfrmMain.aShowExecute(Sender: TObject);
begin
  cxSplitter1.OpenSplitter;
end;

procedure TfrmMain.aSysInfoExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmSysInfo, frmSysInfo);
  try
    frmSysInfo.DoShowForm(odsList.FieldByName('fk_pacid').AsInteger,
                          odsList.FieldByName('peplid').AsInteger,
                          odsList.FieldByName('fk_id').AsInteger); // NazID
    frmSysInfo.ShowModal;
  finally
    frmSysInfo.Free;
  end;
end;

procedure TfrmMain.frxPrintListGetValue(const VarName: String; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := sOtdelName_4Rep;
  if VarName = 'KAB' then Value := odsKab.FieldByName('FC_NAME').AsString;
  if VarName = 'DATENOW' then Value := VarToDateTime(dxdeDate.EditValue);
  if VarName = 'SYSDATE' then Value := GET_SYSDATE_4REP;
  if VarName = 'MEDOTRADESIGN' then Value := MedotradeSign;
end;

procedure TfrmMain.frxRepKabGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := sOtdelName_4Rep;
  if VarName = 'DATESYS' then Value := GET_SYSDATE_4REP;
  if VarName = 'KOLVO' then Value := odsKab.RecordCount;
  if VarName = 'SOTRNAME' then Value := sSotrFIO;
  if VarName = 'MEDOTRADESIGN' then Value := MedotradeSign;  
end;

procedure TfrmMain.frxRepProsmotrGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := sOtdelName_4Rep;
  if VarName = 'PACAGE' then Value := dsList.DataSet.FieldByName('AGE').AsInteger;
  if VarName = 'PACFIO' then Value := dsList.DataSet.FieldByName('FIOPAC').AsString;
  if VarName = 'RUNDATE' then Value := dsList.DataSet.FieldByName('FD_RUN_STR').AsString;
  if VarName = 'ISSLNAME' then Value := dsList.DataSet.FieldByName('FC_NAME').AsString;
  if VarName = 'ISSLTEXT' then Value := sTextIssl_4Rep;
  if VarName = 'DIAGTEXT' then Value := sTextDiag_4Rep;
  if VarName = 'SOTRNAME' then Value := dsList.DataSet.FieldByName('ISPOLFIO').AsString;
  if VarName = 'NUMMK' then Value := sNumIB_4rep;
  if VarName = 'MEDOTRADESIGN' then Value := MedotradeSign;
end;

function TfrmMain.Get_Pac_NUMIB(pFK_PacID: Integer): String;
var
  ODS: TOracleDataSet;
begin
  Result := '';
  ods := TOracleDataSet.Create(nil);

  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT asu.pkg_regist_pacfunc.GET_PAC_IB(:PACID) NUM_IB FROM DUAL';
    ods.DeclareAndSet(':PACID', otInteger, pFK_PACID);
    ods.Open;
    Result := ods.FieldByName('NUM_IB').AsString;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.tbnPrintClick(Sender: TObject);
var ods : TOracleDataSet;
begin
  if dsList.DataSet.RecordCount <> 0 then
    begin
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := os;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' SELECT TO_CHAR(SYSDATE, ''DD.MM.YYYY HH24:MI'') AS SYSTEMDATE FROM DUAL ';
        ods.Open;
        GET_SYSDATE_4REP := ods.FieldByName('SYSTEMDATE').AsString;
      finally
        ods.Free;
      end;
      frxPrintList.ShowReport;
    end;
end;

procedure TfrmMain.tmrCheckApplicationTimer(Sender: TObject);
var Wnd               : hWnd;
    buff              : array[0..127] of Char;
    i, j, iDel        : Integer;
begin
  Application.ProcessMessages;
  if not(tmrCheckApplication.Enabled) then exit;
  iDel:=0;
  for i:=0 to Length(arFIO)-1 do
  begin
    Wnd := GetWindow(Handle, gw_HWndFirst);
    while Wnd <> 0 do
    begin
      if (Wnd <> Application.Handle) and (GetWindow(Wnd, gw_Owner) = 0) then
        begin
          GetWindowText(Wnd, buff, sizeof(buff));
          if StrPas(buff) = arFIO[i-iDel] then
            begin
              if IsWindowVisible(Wnd) then
              begin
                  for j:=i-iDel to Length(arFIO)-2 do
                  begin
                    arFIO[j]:=arFio[j+1];
                  end;
                  SetLength(arFIO,Length(arFIO)-1);
                  Inc(iDel);
                  if Length(arFIO) = 0 then
                  begin
                    tmrCheckApplication.Enabled:=False;
                    Screen.Cursor:=crDefault;
                    aOpen.Enabled:=True;
                    Exit;
                  end;
                  Break;
              end;
            end;
        end;
      Wnd := GetWindow(Wnd, gw_hWndNext);
    end;
  end;
end;

procedure TfrmMain.cxAllPropertiesEditValueChanged(Sender: TObject);
begin
  if cxAll.EditValue = 1 then
    begin
      dsList.DataSet := odsListAll;
      aRefreshExecute(nil);
    end else
    begin
      dsList.DataSet := odsList;
      aRefreshExecute(nil);
    end;
end;

procedure TfrmMain.cxDateEdit1PropertiesChange(Sender: TObject);
begin
  DateChange;
  paDate.Repaint;
  paDate.Refresh;
  p1.Repaint;
  p1.Refresh;
  p2.Repaint;
  p2.Refresh;
  p3.Repaint;
  p3.Refresh;
  p4.Repaint;
  p4.Refresh;
  p5.Repaint;
  p5.Refresh;
  p6.Repaint;
  p6.Refresh;
  p7.Repaint;
  p7.Refresh;
  aRefreshExecute(nil);
end;


   function TfrmMain.SetSkin(SkinName: string): boolean;
var
    ASkinNameList, AResNameList: TStringList;
    AResourceStream: TResourceStream;
begin
    ASkinNameList := TStringList.Create;
    AResNameList := TStringList.Create;
 
    if (DLLHandleSkin <> 0) and (Length(SkinName) > 0) then
    begin
 
        dxSkinsPopulateSkinResources(DLLHandleSkin, AResNameList, ASkinNameList);
 
        AResourceStream := TResourceStream.Create(GetModuleHandle(S_RESBPL),
            AResNameList[ASkinNameList.IndexOf(SkinName)], PChar(sdxResourceType));
        try
            dxSkinsUserSkinLoadFromStream(AResourceStream, SkinName);
        finally
            AResourceStream.Free;
        end;
 
        dxSkinController1.SkinName := 'UserSkin';
        dxSkinController1.UseSkins := True;
        cxLookAndFeelController1.SkinName := 'UserSkin';
//        dxBarManager1.LookAndFeel.SkinName := 'UserSkin';
 
    end;

    FreeAndNil(AResNameList);
    FreeAndNil(ASkinNameList);

end;
//7. Пишем тело процедуры:
procedure TfrmMain.SetDesignApplication;
var
    SkinName: string;
begin
//        SK1.SkinName := 'iMaginary';
//        SK1.UseSkins := true;
//        cxLookAndFeelController1.SkinName := 'iMaginary';
//


  // Загрузим длл-ку скинов
    if DLLHandleSkin = 0 then
    begin
        try
            DLLHandleSkin := GetModuleHandle(S_RESBPL);
            if DLLHandleSkin = 0 then
                DLLHandleSkin := LoadLibrary(S_RESBPL);
        except

        end;
    end;
    if DLLHandleSkin > 0 then
    begin


        if uGlobalConst.ReadSettingDesign(N_SOTR_PEPLID) = 'NEW' then
           DataSkinsModule.flgNewDesign := True
        else
           DataSkinsModule.flgNewDesign := False;


        if DataSkinsModule.flgNewDesign then
        begin
            SkinName := uGlobalConst.ReadUserSkinName(N_SOTR_PEPLID);
            if length(SkinName) = 0 then
                SkinName := 'Medotrade'; //'LondonLiquidSky';
            SetSkin(SkinName);
        end
        else
        begin
            dxSkinController1.SkinName := 'Medotrade';
            dxSkinController1.UseSkins := true;
            cxLookAndFeelController1.SkinName := 'Medotrade';
          BM.LookAndFeel.SkinName := 'Medotrade';
        end;
    end
    else
    begin
        dxSkinController1.SkinName := 'Medotrade';
        dxSkinController1.UseSkins := true;
        cxLookAndFeelController1.SkinName := 'Medotrade';
        BM.LookAndFeel.SkinName := 'Medotrade';
    end;

end;
//
end.
