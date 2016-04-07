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
  cxBarEditItem, uReportUtils, uDigitalSignature, SMMainAPI,
  cxLabel, frxRich, RVStyle, rvhtmlimport, RVScroll, RichView, RVEdit, uGlobalConst,
  JvComponentBase, JvAppStorage, JvAppXMLStorage, cxImageComboBox, dxSkinsStrs,
  IniFiles, DCM_Connection, cxSpinEdit, cxLookAndFeels, dxSkinsForm, cxRadioGroup,
  JvAppRegistryStorage, JvFormPlacement;

const
  S_RESBPL = 'prResourceDll';

type
  TSetSignFnc = procedure (aSignFnc: TSignFnc); stdcall;
  TShowPacInfo = function(HostObjHandle: THandle; pPacID: integer; EditMode: boolean; pSotrID: integer): LongInt; stdcall;
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
    TVListVRACHFIO: TcxGridDBColumn;
    TVListNAZ: TcxGridDBColumn;
    TVListPARAM: TcxGridDBColumn;
    cxGrLevel1: TcxGridLevel;
    aFill: TAction;
    aVrach: TAction;
    pmTV: TPopupMenu;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    sdPopUp: TSaveDialog;
    N1: TMenuItem;
    aCancel: TAction;
    odsListFK_ID: TFloatField;
    odsListFK_SMID: TFloatField;
    odsListFD_NAZ: TDateTimeField;
    odsListFK_PACID: TFloatField;
    odsListFK_NAZSOSID: TFloatField;
    odsListFK_ISPOLID: TFloatField;
    odsListVRACHFIO: TStringField;
    odsListFIOPAC: TStringField;
    odsListFD_ROJD: TDateTimeField;
    odsListAGE: TFloatField;
    odsListFC_NAME: TStringField;
    odsListFC_DIAG: TStringField;
    odsListPARAM: TStringField;
    TVSOS: TcxGridDBColumn;
    N2: TMenuItem;
    odsListPEPLID: TFloatField;
    TVSEX: TcxGridDBColumn;
    odsListFD_RUN: TDateTimeField;
    odsListSEX: TStringField;
    odsListSTATE: TStringField;
    odsListTIME_ISL: TStringField;
    TVSTATE: TcxGridDBColumn;
    TVTIME_ISL: TcxGridDBColumn;
    aPreview: TAction;
    aEditNaz: TAction;
    odsListFK_ROOMID: TIntegerField;
    stRep: TcxStyleRepository;
    cxStyle1: TcxStyle;
    odsListOTDEL: TStringField;
    TVOTDEL: TcxGridDBColumn;
    odsListFC_TYPE: TStringField;
    odsListFK_NAZTYPEID: TFloatField;
    TVNAZTYPE: TcxGridDBColumn;
    TVFK_NAZTYPE: TcxGridDBColumn;
    TVDATENAZ: TcxGridDBColumn;
    aEdit: TAction;
    aInfo: TAction;
    aSearch: TAction;
    pmPrint: TPopupMenu;
    N3: TMenuItem;
    N4: TMenuItem;
    frxDBPrintList: TfrxDBDataset;
    frxPrintList: TfrxReport;
    ApplicationEvents1: TApplicationEvents;
    odsListFD_NAZ_STR: TStringField;
    odsListFD_RUN_STR: TStringField;
    odsListFK_VRACHID: TFloatField;
    aProsmotr: TAction;
    frxRepProsmotr: TfrxReport;
    odsListISPOLFIO: TStringField;
    aDolg: TAction;
    BM: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    BMBar1: TdxBar;
    bbRefresh: TdxBarButton;
    bbInfo: TdxBarButton;
    bbFind: TdxBarButton;
    bbOpenMK: TdxBarButton;
    bbWork: TdxBarButton;
    dxBarButton6: TdxBarButton;
    dxBarButton7: TdxBarButton;
    dxBarButton8: TdxBarButton;
    dxBarButton9: TdxBarButton;
    dxBarButton10: TdxBarButton;
    dxBarButton11: TdxBarButton;
    dxBarButton12: TdxBarButton;
    dxBarPopupMenu1: TdxBarPopupMenu;
    dxBarButton15: TdxBarButton;
    dxBarButton16: TdxBarButton;
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
    pmKab: TPopupMenu;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    Web1: TMenuItem;
    XLS1: TMenuItem;
    XLS2: TMenuItem;
    frxRepKab: TfrxReport;
    frxDBKab: TfrxDBDataset;
    aArchive: TAction;
    bbArchive: TdxBarButton;
    N8: TMenuItem;
    cxPrOtmena: TcxBarEditItem;
    aPac: TAction;
    odsListIS_AMB: TFloatField;
    dxdeDate: TcxBarEditItem;
    DateText: TcxStyle;
    aHide: TAction;
    aShow: TAction;
    tmrCheckApplication: TTimer;
    aEditType: TAction;
    N9: TMenuItem;
    N10: TMenuItem;
    aMS: TAction;
    N11: TMenuItem;
    aText: TAction;
    aWeb: TAction;
    aXML: TAction;
    aXLS: TAction;
    aTextKab: TAction;
    aWebKab: TAction;
    aXMLKab: TAction;
    aXLSKab: TAction;
    aPrint: TAction;
    aPrintKab: TAction;
    aCopyFIO: TAction;
    N12: TMenuItem;
    aNaz: TAction;
    N13: TMenuItem;
    cxStyle2: TcxStyle;
    stBold: TcxStyle;
    aSysInfo: TAction;
    cxPrSotr: TcxBarEditItem;
    bbDolgTalon: TdxBarButton;
    actDolgTalon: TAction;
    odsListKardio: TOracleDataSet;
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
    StringField12: TStringField;
    VListTypePriem: TcxGridDBColumn;
    VListVidOpl: TcxGridDBColumn;
    odsListTYPEPRIEM: TStringField;
    odsListVIDOPLAT: TStringField;
    odsListKardioTYPEPRIEM: TStringField;
    odsListKardioSEX: TStringField;
    odsListKardioPARAM: TStringField;
    odsListKardioTIME_ISL: TStringField;
    odsListKardioOTDEL: TStringField;
    odsListKardioFC_TYPE: TStringField;
    odsListKardioVIDOPLAT: TStringField;
    VListStatusKart: TcxGridDBColumn;
    odsListKardioSTATUSMK: TStringField;
    odsListSTATUSMK: TStringField;
    VListStatusTalon: TcxGridDBColumn;
    odsListKardioSTATUSTALON: TStringField;
    odsListSTATUSTALON: TStringField;
    frxRepProsmotr_Travma: TfrxReport;
    rve1: TRichViewEdit;
    RvHtmlImporter1: TRvHtmlImporter;
    RVStyle1: TRVStyle;
    frxRichObject1: TfrxRichObject;
    AppStorage: TJvAppXMLFileStorage;
    aSnimok: TAction;
    odsListFK_RESULTID: TFloatField;
    odsListKardioFK_RESULTID: TFloatField;
    VListCntSnimok: TcxGridDBColumn;
    ilCntImage: TImageList;
    bbEditNaz: TdxBarLargeButton;
    bbPac: TdxBarLargeButton;
    bbEditType: TdxBarLargeButton;
    bbSnimok: TdxBarLargeButton;
    frxRepProsmotr_SOKB: TfrxReport;
    rListMGR: TfrxReport;
    odsListMC: TOracleDataSet;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    DateTimeField4: TDateTimeField;
    FloatField13: TFloatField;
    FloatField14: TFloatField;
    FloatField15: TFloatField;
    StringField13: TStringField;
    StringField14: TStringField;
    DateTimeField5: TDateTimeField;
    FloatField16: TFloatField;
    StringField15: TStringField;
    StringField16: TStringField;
    StringField17: TStringField;
    FloatField17: TFloatField;
    DateTimeField6: TDateTimeField;
    StringField18: TStringField;
    StringField19: TStringField;
    StringField20: TStringField;
    IntegerField2: TIntegerField;
    StringField21: TStringField;
    StringField22: TStringField;
    FloatField18: TFloatField;
    StringField23: TStringField;
    StringField24: TStringField;
    FloatField19: TFloatField;
    StringField25: TStringField;
    FloatField20: TFloatField;
    StringField26: TStringField;
    StringField27: TStringField;
    StringField28: TStringField;
    StringField29: TStringField;
    FloatField21: TFloatField;
    rProt_TO: TfrxReport;
    aEditIssl: TAction;
    N14: TMenuItem;
    bbCD: TdxBarLargeButton;
    aCD: TAction;
    dxSkinController: TdxSkinController;
    cxLookAndFeelController: TcxLookAndFeelController;
    grdbtvSMID: TcxGridDBColumn;
    beichbNotRaspred: TcxBarEditItem;
    beichbTypePac: TcxBarEditItem;
    JvFormStorage1: TJvFormStorage;
    JvAppRegistryStorage1: TJvAppRegistryStorage;
    odsListARCHIVED: TStringField;
    odsListKardioARCHIVED: TStringField;
    odsListMCARCHIVED: TStringField;
    odsListKabUnKabinet: TOracleDataSet;
    grdbtvID: TcxGridDBColumn;
    odsListKabUnKabinetFK_ID: TFloatField;
    odsListKabUnKabinetFK_SMID: TFloatField;
    odsListKabUnKabinetFD_NAZ: TDateTimeField;
    odsListKabUnKabinetFD_NAZ_STR: TStringField;
    odsListKabUnKabinetFD_RUN: TDateTimeField;
    odsListKabUnKabinetFD_RUN_STR: TStringField;
    odsListKabUnKabinetFK_PACID: TFloatField;
    odsListKabUnKabinetFK_NAZSOSID: TFloatField;
    odsListKabUnKabinetFK_RESULTID: TFloatField;
    odsListKabUnKabinetFK_ISPOLID: TFloatField;
    odsListKabUnKabinetFK_VRACHID: TFloatField;
    odsListKabUnKabinetFK_ROOMID: TIntegerField;
    odsListKabUnKabinetFK_NAZTYPEID: TFloatField;
    odsListKabUnKabinetVRACHFIO: TStringField;
    odsListKabUnKabinetISPOLFIO: TStringField;
    odsListKabUnKabinetFIOPAC: TStringField;
    odsListKabUnKabinetFD_ROJD: TDateTimeField;
    odsListKabUnKabinetAGE: TFloatField;
    odsListKabUnKabinetSEX: TStringField;
    odsListKabUnKabinetFC_NAME: TStringField;
    odsListKabUnKabinetFC_DIAG: TStringField;
    odsListKabUnKabinetPARAM: TStringField;
    odsListKabUnKabinetPEPLID: TFloatField;
    odsListKabUnKabinetSTATE: TStringField;
    odsListKabUnKabinetTIME_ISL: TStringField;
    odsListKabUnKabinetOTDEL: TStringField;
    odsListKabUnKabinetFC_TYPE: TStringField;
    odsListKabUnKabinetIS_AMB: TFloatField;
    odsListKabUnKabinetTYPEPRIEM: TStringField;
    odsListKabUnKabinetVIDOPLAT: TStringField;
    odsListKabUnKabinetSTATUSMK: TStringField;
    odsListKabUnKabinetSTATUSTALON: TStringField;
    odsListKabUnKabinetARCHIVED: TStringField;
    grdbtvIsAmb: TcxGridDBColumn;
    procedure aCloseExecute(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure aOpenExecute(Sender: TObject);
    procedure odsKabAfterScroll(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aFillExecute(Sender: TObject);
    procedure aVrachExecute(Sender: TObject);
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
    procedure aPreviewExecute(Sender: TObject);
    procedure aEditNazExecute(Sender: TObject);
    procedure aInfoExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aSearchExecute(Sender: TObject);
    procedure frxPrintListGetValue(const VarName: String;
      var Value: Variant);
    procedure tbnPrintClick(Sender: TObject);
    procedure TVListCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure ApplicationEvents1Message(var Msg: tagMSG; var Handled: Boolean);
    procedure aProsmotrExecute(Sender: TObject);
    procedure frxRepProsmotrGetValue(const VarName: string; var Value: Variant);
    procedure aDolgExecute(Sender: TObject);
    procedure aTextKabExecute(Sender: TObject);
    procedure aWebKabExecute(Sender: TObject);
    procedure aXMLKabExecute(Sender: TObject);
    procedure aXLSKabExecute(Sender: TObject);
    procedure aPrintKabExecute(Sender: TObject);
    procedure frxRepKabGetValue(const VarName: string; var Value: Variant);
    procedure odsKabAfterOpen(DataSet: TDataSet);
    procedure osAfterLogOn(Sender: TOracleSession);
    procedure FormShow(Sender: TObject);
    procedure aArchiveExecute(Sender: TObject);
    procedure aCopyFIOExecute(Sender: TObject);
    procedure cxPrOtmenaPropertiesEditValueChanged(Sender: TObject);
    procedure aPacExecute(Sender: TObject);
    procedure dxdeDateChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure aHideExecute(Sender: TObject);
    procedure aShowExecute(Sender: TObject);
    procedure tmrCheckApplicationTimer(Sender: TObject);
    procedure aEditTypeExecute(Sender: TObject);
    procedure aMSExecute(Sender: TObject);
    procedure aNazExecute(Sender: TObject);
    procedure aSysInfoExecute(Sender: TObject);
    procedure cxPrSotrPropertiesEditValueChanged(Sender: TObject);
    procedure actDolgTalonExecute(Sender: TObject);
    procedure frxRepProsmotr_TravmaGetValue(const VarName: string;
      var Value: Variant);
    procedure aSnimokExecute(Sender: TObject);
    procedure frxRepProsmotr_SOKBGetValue(const VarName: string;
      var Value: Variant);
    procedure rListMGRGetValue(const VarName: string; var Value: Variant);
    procedure rProt_TOGetValue(const VarName: string; var Value: Variant);
    procedure aEditIsslExecute(Sender: TObject);
    procedure aCDExecute(Sender: TObject);
    procedure TVListFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
    procedure beichbTypePacPropertiesChange(Sender: TObject);
    procedure TVKabCustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
  private
    SetSignFnc : TSetSignFnc;
    ShowPacInfo: TShowPacInfo;
    sPhone_4Rep, sSpec_4Rep : string;
    IDNAZ : Integer;
    DLL_FORM_HANDLE : Longint;
    HandleDLL: THandle;
    flgNewDesign : boolean;
    EditPlugin_Personal : TEditPlugin_Personal;
    FileVersion : String;
    procedure DoRefreshSmidConst;
    procedure CheckEnabledButons;
    procedure DateChange;
    procedure BmpToJPEG(pFNAME1,pFNAME2:String);
    function PhysicalResolveFileType(AStream: TStream): Integer;
//    function WinExecAndWait32(FileName: string; Visibility: integer): integer;
    function GetLastTalonID(App_HND: THandle; OS: TORacleSession; pPacID, pSotrID, pTalonID : Integer) : integer;
    function SetSkin(SkinName: string): boolean;
    procedure SetDesignApplication;
    procedure DoShowPatogistNapr(Sender:Tobject);
    { Private declarations }
  public
    dicom_show_3d : Boolean;
    get_dicom_show, get_dicom_port, get_dicom_ip, get_dicom_called, sCallingAET : string;
    sCDDir : string;
    sPath : string; // путь к лаунчеру мультивокса
    get_dbname : string;
    Russian: HKL;
    arFIO:array of string;
    is_digsig : Boolean;
    get_digsig : string;
    gDigSignature: TDigitalSignature;
    MedotradeSign : string;
    sTextIssl_4Rep : String;
    GET_SYSDATE_4REP : String;
    pSOTRID : Integer;
    sSotrFIO : String;
    pAPPSOTRID : Integer;
    GET_ISSLEDID : Integer;
    sCompanyName_4Rep, sOtdelName_4Rep : String;
    pOTDELID : Integer;
    use_odslist_only_raspis,list_diagnost_use_beiKolvoCopy,list_diagnost_beiKolvoCopy_def,LIST_PATANAT_PROSMOTR_HTML : integer;
    procedure DoShowForm;
    procedure DoResult(nNazID: Integer);
    procedure DoResultHTML(nNazID : Integer; nPacID : Integer);
    procedure On_set_form_handle(var Msg: TMessage); message 1024+112;
    procedure DoSetEditRights;
    function RestoreApplication(AAppCaption:string):Boolean;
    function Get_Pac_NUMIB(pFK_PacID: Integer): String;
    { Public declarations }
  end;

var
  frmMain: TfrmMain;
  get_nazcancel, get_vipnaz, get_nazplan, get_nevip, get_recomend, get_neyav,
  listdiagnost_addnazshowanal, list_visible_row_allkabinet : Integer;
  get_systemdate : TDate;
  DLLHandleSkin: THandle;

function IsPaidNaz(OS: TOracleSession; pFK_NazID: Integer): Boolean;

implementation

uses fOtmena, uPeriod, fDolg, fMs, fPreview, fSetNaz, fSearch, udbTableutils, uGlobals,
     fPacInfoDiagnost, fWait, fEditNaz, fArchive, fEditType, fNaz, fSysInfo,
     fDolgTalon, fSetMS, uPrintDocument, uCommonXray, fUpdateNaz, CmnUnit, fCD, uPrintType;
{$R *.dfm}

function IsPaidNaz(OS: TOracleSession; pFK_NazID: Integer): Boolean;
var
  ODS: TOracleDataSet;
begin
  Result := False;

  ods := TOracleDataSet.Create(nil);

  try
    ods.Session := OS;
    ods.SQL.Text := 'SELECT 1 AS N' + #13#10 +
        'FROM ASU.TAPPENDIX_NAZ tn' + #13#10 +
		'INNER JOIN ASU.VNAZ v' + #13#10 +
        'ON tn.FK_NAZID = v.fk_id' + #13#10 +
        'INNER JOIN ASU.TBILL tb' + #13#10 +
        'ON tn.fk_appendixid = tb.fk_appendix' + #13#10 +
        'WHERE tn.fk_nazid = :pFK_NazID AND tb.FP_PAY = 1';
    ods.DeclareAndSet('pFK_NazID', otInteger, pFK_NazID);
    ods.Open;

    Result := ods.RecordCount > 0;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.On_set_form_handle(var Msg: TMessage);
begin
  if (HandleDLL > 0) and (msg.WParam>0) then
    DLL_FORM_HANDLE:=msg.WParam;
end;

procedure TfrmMain.osAfterLogOn(Sender: TOracleSession);
var Ver: TJclFileVersionInfo;
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

procedure TfrmMain.actDolgTalonExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmDolgTalon, frmDolgTalon);
  try
    frmDolgTalon.DoShowfrmDolgTalon;
    frmDolgTalon.ShowModal;
  finally
    frmDolgTalon.Free;
  end;
end;

procedure TfrmMain.aDolgExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmDolg, frmDolg);
  try
    frmDolg.DoShowfrmDolg;
    frmDolg.ShowModal;
  finally
    frmDolg.Free;
  end;
end;

procedure TfrmMain.aRefreshExecute(Sender: TObject);
var id : Integer;
begin
  if (list_visible_row_allkabinet = 1) and (odsKab.FieldByName('fk_id').asinteger = -1) then
   begin
    dsList.DataSet := odsListKabUnKabinet;
    odsListKabUnKabinet.DisableControls;
    id := odsListKabUnKabinet.FieldByName('FK_ID').AsInteger;
    odsListKabUnKabinet.Close;
    odsListKabUnKabinet.SetVariable('PFD_DATE', dxdeDate.EditValue);
    if get_dbname = 'SK' then
     begin
       odsListKabUnKabinet.DeclareAndSet('Pispol', otinteger, pSOTRID);
       odsListKabUnKabinet.DeclareVariable('PISSTAC', otSubst);
     end
    else
     begin
       if odsListKabUnKabinet.VariableIndex('pispol') > 0 then
        odsListKabUnKabinet.DeleteVariable('pispol');
       if odsListKabUnKabinet.VariableIndex('PISSTAC') > 0 then
        odsListKabUnKabinet.DeleteVariable('PISSTAC');
     end;

    if beichbNotRaspred.EditValue then
      odsListKabUnKabinet.SetVariable('PRASPRED', '')
    else
     begin
      {if (get_dbname = 'MC') or (use_odslist_only_raspis = -1) then
        odsListKabUnKabinet.SetVariable('PRASPRED', ' and (((isl.fl_in_raspis = 1) and exists(select 1 from asu.tpaclst where nazid = isl.fk_id and fl_bron = 0)) or (isl.fk_nazsosid = asu.get_vipnaz)) ')
      else if (use_odslist_only_raspis = 1) then
        odsListKabUnKabinet.SetVariable('PRASPRED', ' and (((isl.fl_in_raspis = 1) and exists(select 1 from asu.tpaclst where nazid = isl.fk_id)) or (isl.fk_nazsosid = asu.get_vipnaz)) ')
      else if (use_odslist_only_raspis = 4) then
        odsListKabUnKabinet.SetVariable('PRASPRED', ' and ((isl.fl_in_raspis = 1) or (isl.fk_nazsosid = asu.get_vipnaz)) ')
      else if (use_odslist_only_raspis = 3) then
        odsListKabUnKabinet.SetVariable('PRASPRED', ' and ((exists(select 1 from asu.tpaclst where nazid = isl.fk_id)) or (isl.fk_nazsosid = asu.get_vipnaz)) ')
      else if use_odslist_only_raspis = 2 then
        odsListKabUnKabinet.SetVariable('praspred',' and exists (select 1 from asu.tregistnaz where fk_nazid = isl.fk_id) ')
      else   }
        odsListKabUnKabinet.SetVariable('PRASPRED', '');
     end;

    if get_dbname = 'SK' then
     begin
      case beichbTypePac.EditValue of
       0:odsListKabUnKabinet.SetVariable('PISSTAC', '');
       1:odsListKabUnKabinet.SetVariable('PISSTAC', ' and asu.is_ambulance(fk_pacid) = 0 ');
       2:odsListKabUnKabinet.SetVariable('PISSTAC', ' and asu.is_ambulance(fk_pacid) = 1 ');
      end;
     end;

    odsListKabUnKabinet.Open;
    odsListKabUnKabinet.EnableControls;
    odsListKabUnKabinet.Locate('FK_ID', id, []);
   end
  else
   begin
    dsList.dataset := odsList;
    odsList.DisableControls;
    id := odsList.FieldByName('FK_ID').AsInteger;
    odsList.Close;
    odsList.SetVariable('PFK_ROOMID', odsKab.FieldByName('FK_ID').AsInteger);
    odsList.SetVariable('PFD_DATE', dxdeDate.EditValue);
    if get_dbname = 'SK' then
     begin
       odsList.DeclareAndSet('Pispol', otinteger, pSOTRID);
       odsList.DeclareVariable('PISSTAC', otSubst);
     end
    else
     begin
       if odsList.VariableIndex('pispol') > 0 then
        odsList.DeleteVariable('pispol');          
       if odsList.VariableIndex('PISSTAC') > 0 then
        odsList.DeleteVariable('PISSTAC');
     end;

    if beichbNotRaspred.EditValue then
      odsList.SetVariable('PRASPRED', '')
    else
     begin
      if (get_dbname = 'MC') or (use_odslist_only_raspis = -1) then
        odsList.SetVariable('PRASPRED', ' and (((isl.fl_in_raspis = 1) and exists(select 1 from asu.tpaclst where nazid = isl.fk_id and fl_bron = 0)) or (isl.fk_nazsosid = asu.get_vipnaz)) ')
      else if (use_odslist_only_raspis = 1) then
        odsList.SetVariable('PRASPRED', ' and (((isl.fl_in_raspis = 1) and exists(select 1 from asu.tpaclst where nazid = isl.fk_id)) or (isl.fk_nazsosid = asu.get_vipnaz)) ')
      else if (use_odslist_only_raspis = 4) then
        odsList.SetVariable('PRASPRED', ' and ((isl.fl_in_raspis = 1) or (isl.fk_nazsosid = asu.get_vipnaz)) ')
      else if (use_odslist_only_raspis = 3) then
        odsList.SetVariable('PRASPRED', ' and ((exists(select 1 from asu.tpaclst where nazid = isl.fk_id)) or (isl.fk_nazsosid = asu.get_vipnaz)) ')
      else if use_odslist_only_raspis = 2 then
        odsList.SetVariable('praspred',' and exists (select 1 from asu.tregistnaz where fk_nazid = isl.fk_id) ')
      else
        odsList.SetVariable('PRASPRED', '');
     end;

    if get_dbname = 'SK' then
     begin
      case beichbTypePac.EditValue of
       0:odsList.SetVariable('PISSTAC', '');
       1:odsList.SetVariable('PISSTAC', ' and asu.is_ambulance(fk_pacid) = 0 ');
       2:odsList.SetVariable('PISSTAC', ' and asu.is_ambulance(fk_pacid) = 1 ');
      end;
     end;

    odsList.Open;
    odsList.EnableControls;
    odsList.Locate('FK_ID', id, []);
   end;
end;

procedure TfrmMain.aOpenExecute(Sender: TObject);
var AppProcID : Integer; 
begin
{$IFDEF USE_NEW_AUTH}
  try
    if RestoreApplication(dsList.DataSet.FieldByName('FIOPAC').AsString + ' - ' + Get_Pac_NUMIB(dsList.DataSet.FieldByName('FK_PACID').AsInteger))
    then Exit;

    SetLength(arFIO,Length(arFIO)+1);
    arFIO[Length(arFIO)-1]:=dsList.DataSet.FieldByName('FIOPAC').AsString;
    aOpen.Enabled:=False;
    Application.ProcessMessages;
    Screen.Cursor := crSQLWait;
    tmrCheckApplication.Enabled:=True;

    AppProcID := AppStart(ExtractFilePath(paramstr(0))+'IBRazdel.exe', IntToStr(dsList.DataSet.FieldByName('FK_PACID').AsInteger)+' '+IntToStr(-1)+' '+IntToStr(-1));
    if AppProcID = -1 then ShowMessage('Ошибка запуска приложения');
    ShowWait(dsList.DataSet.FieldByName('FK_PACID').AsInteger, True);
  finally
    aOpen.Enabled:=True;
    Screen.Cursor := crDefault;
  end;
{$ELSE}
  if ShellExecute(Application.Handle,
                  pChar('open'),
                  PChar(ExtractFilePath(paramstr(0)) + 'IBRazdel.exe'),
                  PChar(IntToStr(frmMain.pAPPSOTRID) + ' ' +
                  IntToStr(dsList.DataSet.FieldByName('FK_PACID').AsInteger) + ' ' +
                  IntToStr(-1) + ' ' +
                  IntToStr(-1)), PChar(ExtractFilePath(paramstr(0))), SW_SHOWNORMAL) < 32 then
    Application.MessageBox('Запуск внешнего модуля не удался.', 'Ошибка', MB_OK + MB_ICONERROR);
  ShowWait(dsList.DataSet.FieldByName('FK_PACID').AsInteger,False);
{$ENDIF}
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
  if odsList.FieldByName('IS_AMB').AsInteger = 1 then
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
                            odsList.FieldByName('PEPLID').AsInteger, 
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
                            odsList.FieldByName('FK_PACID').AsInteger,
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
    ods.SQL.Text := ' SELECT NAZ.FK_SMID FROM asu.TVRACHKAB KAB, asu.TVRACHKAB_NAZ NAZ '+#13+
                    '  WHERE KAB.FK_SOTRID = :PFK_SOTRID '+#13+
                    '    AND KAB.FK_ID = NAZ.FK_SOTRKABID '+#13+
                    '    AND FK_SMID = (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM = :PFC_SYNONIM) ';
    ods.DeclareAndSet('PFK_SOTRID', otInteger, pSOTRID);
    ods.DeclareAndSet('PFC_SYNONIM', otString, 'DIAGNOSTIC_RIGHTS_OPENMK');
    ods.Open;
    aOpen.Visible := ods.RecordCount <> 0; // Открыть МК
    ods.Close;
    ods.DeleteVariables;
    ods.DeclareAndSet('PFK_SOTRID', otInteger, pSOTRID);
    ods.DeclareAndSet('PFC_SYNONIM', otString, 'DIAGNOSTIC_RIGHTS_WORKPROTOCOL');
    ods.Open;
    aVrach.Visible := ods.RecordCount <> 0; // Работа с протоколами
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
    ods.DeclareAndSet('PFC_SYNONIM', otString, 'DIAGNOSTIC_RIGHTS_SHOWSOTR');
    ods.Open;
    if ods.RecordCount = 0 then
      begin
        cxPrSotr.Visible := ivNever;
      end else
      begin
        cxPrSotr.Visible := ivAlways;
      end;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.DoShowForm;
var ods : TOracleDataSet;
    Reg : TRegIniFile;
    id : Integer;
begin
  frmMain.Show;
  DoRefreshSmidConst;
  if get_dbname = 'SK' then
    odsList.SQL.Text := odsListKardio.SQL.Text; // Сургут Кардио
  if get_dbname = 'MC' then
    odsList.SQL.Text := odsListMC.SQL.Text; // Междуреченск

  use_odslist_only_raspis := udbTableutils.TDBUtils.GetConstantDef('use_odslist_only_raspis',os,-1);
  list_diagnost_use_beiKolvoCopy := udbTableutils.TDBUtils.GetConstantDef('list_diagnost_use_beiKolvoCopy',os,0);
  list_diagnost_beiKolvoCopy_def := udbTableutils.TDBUtils.GetConstantDef('list_diagnost_beiKolvoCopy_def',os,1);

  pAPPSOTRID := StrToInt(paramstr(1));
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select tappsotr.fk_sotrid, '+#13+
                    '        tsotr.fc_fam || '' '' || '+#13+
                    '        decode(asu.varcharisnull(tsotr.fc_name), 1, '''', substr(tsotr.fc_name, 0, 1) || ''. '' || '+#13+
                    '        decode (asu.varcharisnull(tsotr.fc_otch), 1, '''', substr(tsotr.fc_otch, 0, 1) || ''. '')) as sotrfio, '+#13+
                    '        asu.pkg_smini.readstring(''CONFIG'', ''S_FULLNAME'', '''') as companyname, '+#13+
                    '        totdel.fc_name as otdelname, '+#13+
                    '        totdel.fk_id as OtdelID '+#13+
                    '   from login.tappsotr, asu.tsotr, asu.totdel '+#13+
                    '  where tappsotr.fk_sotrid = tsotr.fk_id '+#13+
                    '    and tsotr.fk_otdelid = totdel.fk_id '+#13+
                    '    and tappsotr.fl_del <> 1 '+#13+
                    '    and tappsotr.fk_id = :pfk_id ';
    ods.DeclareAndSet('PFK_ID', otInteger, pAPPSOTRID);
    ods.Open;
    pSOTRID := ods.FieldByName('FK_SOTRID').AsInteger;
    pOTDELID := ods.FieldByName('OtdelID').AsInteger;
    sSotrFIO := ods.FieldByName('SOTRFIO').AsString;
    sCompanyName_4Rep := ods.FieldByName('COMPANYNAME').AsString;
    sOtdelName_4Rep := ods.FieldByName('OTDELNAME').AsString;
    DoSetEditRights;
    odsKab.AfterScroll := nil;
    if list_visible_row_allkabinet = 1 then
    odsKab.SetVariable('pAllKabRow','select -1 as fk_id, ''Все кабинеты'' as fc_name, -1 as fn_order from dual union all ');
    odsKab.Open;                               
    cxPrOtmena.enabled := odsKab.fieldbyname('fk_id').AsInteger > -1;
    cxPrSotr.enabled := odsKab.fieldbyname('fk_id').AsInteger > -1;
//------------------------------------------------------------------------------
    Reg:=TRegIniFile.Create;
    try
      Reg.RootKey:=HKEY_CURRENT_USER;
      Reg.OpenKey('\Software\Softmaster\List_Diagnost\ID_SOTR'+IntToStr(pSOTRID), True);
      id := Reg.ReadInteger('\Software\Softmaster\List_Diagnost\ID_SOTR'+IntToStr(pSOTRID), 'ID_OTMENA', 0);
      case id of
        1: cxPrOtmena.EditValue := 1;
        0: cxPrOtmena.EditValue := 0;
      end;
      cxPrOtmenaPropertiesEditValueChanged(nil);
      id := Reg.ReadInteger('\Software\Softmaster\List_Diagnost\ID_SOTR'+IntToStr(pSOTRID), 'ID_KABINET', 0);
      if id <> 0 then
        odsKab.Locate('FK_ID', id, []);
      if cxPrSotr.Visible = ivAlways then
        begin
          id := Reg.ReadInteger('\Software\Softmaster\List_Diagnost\ID_SOTR'+IntToStr(pSOTRID), 'ID_SHOWSOTR', 0);
          case id of
            1: cxPrSotr.EditValue := 1;
            0: cxPrSotr.EditValue := 0;
          end;
          cxPrSotrPropertiesEditValueChanged(nil);
        end;
    finally
      Reg.Free;
    end;
//------------------------------------------------------------------------------
    odsKab.AfterScroll := odsKabAfterScroll;
    dxdeDate.EditValue := GET_SYSTEMDATE;
    frmMain.Caption := 'Журнал врача-диагноста('+FileVersion+'). Пользователь: '+sSotrFIO+'; Кабинет: '+odsKab.FieldByName('FC_NAME').AsString;
    cxGr.SetFocus;

    MedotradeSign := ReadMedotradeSign;
    TVList.StoreToRegistry('\SoftWare\SoftMaster\List_Diagnost\cxGrVrach_' + IntToStr(pSOTRID)+'Default', TRUE, [], 'cxGr');
    TVList.RestoreFromRegistry('\SoftWare\SoftMaster\List_Diagnost\cxGrVrach_' + IntToStr(pSOTRID), FALSE, FALSE, [], 'cxGr');
    VListTypePriem.Visible := get_dbname = 'SK';
    VListVidOpl.Visible := (get_dbname = 'SK') or (get_dbname = 'MC'); // только для кардио и междуреченска
    VListStatusKart.Visible := get_dbname = 'SK';
    VListStatusTalon.Visible := get_dbname = 'SK';
    VListTypePriem.Hidden := get_dbname <> 'SK';
    VListVidOpl.Hidden := (get_dbname <> 'SK') or (get_dbname <> 'MC');
    VListStatusKart.Hidden := get_dbname <> 'SK';
    VListStatusTalon.Hidden := get_dbname <> 'SK';

// -- для Кардио меняем название колонки
    if get_dbname <> 'SK' then
      begin
        TVNAZTYPE.Caption := 'Тип';
      end else
      begin
        TVNAZTYPE.Caption := 'Комментарии';
      end;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.DoShowPatogistNapr(Sender: Tobject);
var
 DLL_PRINT_HANDLE: THandle;
 PrintPathohistEndo: procedure (pFK_NAZID_VALUE, pAPPSOTRID: integer);stdcall;
begin
  //frviewer4Print(CITOLOG_NAZ_FILE_NAME, odsVNAZ.FieldByName('FK_ID').AsString);
  DLL_PRINT_HANDLE := LoadLibrary('DLL_PRINT.DLL');
 Try
 if DLL_PRINT_HANDLE <> 0 then
   begin
     @PrintPathohistEndo := GetProcAddress(DLL_PRINT_HANDLE, 'DoPrintNaprPathohist');
     if @PrintPathohistEndo <> nil then
      PrintPathohistEndo(odslist.FieldByName('FK_ID').AsINteger, pAPPSOTRID);
   end;
 Finally
   FreeLibrary(DLL_PRINT_HANDLE);
 End;
end;

procedure TfrmMain.odsKabAfterOpen(DataSet: TDataSet);
begin
  aPrintKab.Enabled := odsKab.RecordCount <> 0;
end;

procedure TfrmMain.odsKabAfterScroll(DataSet: TDataSet);
begin
  cxPrOtmena.enabled := odsKab.fieldbyname('fk_id').AsInteger > -1;
  cxPrSotr.enabled := odsKab.fieldbyname('fk_id').AsInteger > -1;

  aRefreshExecute(Self);
  frmMain.Caption := '';
  frmMain.Caption := 'Журнал врача-диагноста('+FileVersion+'). Пользователь: '+sSotrFIO+'; Кабинет: '+odsKab.FieldByName('FC_NAME').AsString;
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var Reg : TRegIniFile;
begin
  Reg := TRegIniFile.Create;
  try
    Reg.RootKey:=HKEY_CURRENT_USER;
    if not Reg.OpenKey('\Software\Softmaster\List_Diagnost\', FALSE) then
      begin
        Reg.CreateKey('\Software\Softmaster\List_Diagnost');
      end;
    try
      Reg.WriteInteger('\Software\Softmaster\List_Diagnost\ID_SOTR'+IntToStr(pSOTRID), 'ID_KABINET', odsKab.FieldByName('FK_ID').AsInteger);
      Reg.WriteInteger('\Software\Softmaster\List_Diagnost\ID_SOTR'+IntToStr(pSOTRID), 'ID_OTMENA',  cxPrOtmena.EditValue);
      if cxPrSotr.Visible = ivAlways then   
        Reg.WriteInteger('\Software\Softmaster\List_Diagnost\ID_SOTR'+IntToStr(pSOTRID), 'ID_SHOWSOTR',  cxPrSotr.EditValue);
    except
    end;
  finally
    Reg.Free;
  end;
  TVList.StoreToRegistry('\SoftWare\SoftMaster\List_Diagnost\cxGrVrach_' + IntToStr(pSOTRID), TRUE, [], 'cxGr');
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Application.MessageBox('Вы хотите выйти из приложения ?', 'Вопрос', MB_YESNO + MB_ICONQUESTION) = MrYes then
    begin
      if frmMain.sPath <> '' then
        begin
          ShellExecute(Application.Handle,
                       pChar('open'),
                       pChar(sPath+'MvLauncher.exe'),
                       pChar('-cmd:Close'),
                       pChar(sPath),
                       SW_SHOWNORMAL);
        end;
      action := caFree
    end else
    begin
      action := caNone;
    end;
end;

procedure TfrmMain.aFillExecute(Sender: TObject);
var ods : TOracleDataSet;
     oq : TOracleQuery;
    IDSMID : Integer;
begin
  IDNAZ := odsList.FieldByName('FK_ID').AsInteger;
	IDSMID := -1;
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT FK_ID FROM ASU.TSMID WHERE FK_OWNER = :PFK_OWNER AND FL_SHOWANAL = 1 ';
    ods.DeclareAndSet('PFK_OWNER', otInteger, odsList.FieldByName('FK_SMID').AsInteger);
    ods.Open;
    if ods.RecordCount > 1 then
      begin
        Application.CreateForm(TfrmSetNaz, frmSetNaz);
        frmSetNaz.DoShowForm(odsList.FieldByName('FK_SMID').AsInteger);
        frmSetNaz.ShowModal;
        if frmSetNaz.ModalResult = MrOk then
          begin
            oq := TOracleQuery.Create(nil);
            try
              oq.Session := os;
              oq.Cursor := crSQLWait;
              oq.SQL.Text := ' UPDATE ASU.TNAZIS SET FK_SMID = :PFK_SMID WHERE FK_ID = :PFK_ID ';
              oq.DeclareAndSet('PFK_SMID', otInteger, frmSetNaz.odsNaz.FieldByName('FK_ID').AsInteger);
              oq.DeclareAndSet('PFK_ID', otInteger, odsList.FieldByName('FK_ID').AsInteger);
              oq.Execute;
              IDSMID := frmSetNaz.odsNaz.FieldByName('FK_ID').AsInteger;
              os.Commit;
            finally
              oq.Free;
            end;
            frmSetNaz.Free;
          end else
          begin
            frmSetNaz.Free;
            exit;
          end;
      end;
  finally
    ods.Free;
  end;
//------------------------------------------------------------------------------
  HandleDLL := LoadLibrary('PriemDll.dll');
  if HandleDLL <> 0 then
    begin
      EditPlugin_Personal := GetProcAddress(HandleDLL, 'EditPlugin_Personal');
      if @EditPlugin_Personal <> nil then
      begin
        try
          @SetSignFnc := GetProcAddress(HandleDLL, 'SetSignFnc');
          if Assigned(@SetSignFnc) then
            SetSignFnc(frmMain.gDigSignature.SignDocument);
					EditPlugin_Personal(Panel1.Handle, //хэндл панели
															Application.Handle, //хэндл аппликейшена
															odsList.FieldByName('FK_PACID').AsInteger, //код пациента
															pSOTRID, //код сотрудника
															pAPPSOTRID, //специализация
                              -1, //секция
															IDSMID, //odsList.FieldByName('FK_SMID').AsInteger, //смид
															odsList.FieldByName('FK_ID').AsInteger, //назид
															FALSE,
															odsList.FieldByName('FK_ID').AsInteger, //ид объекта
															Panel1.Parent.Handle);
        except
        end;
      end;
    end;
  try
    Application.ProcessMessages;
    FreeLibrary(HandleDLL);
    HandleDll:=0;
  except
  end;
  RefreshQuery(odsList);
  odsList.Locate('FK_ID', IDNAZ, []);
end;

procedure TfrmMain.aHideExecute(Sender: TObject);
begin
  cxSplitter1.CloseSplitter;
end;

procedure TfrmMain.aVrachExecute(Sender: TObject);
var AppProcID : Integer;
begin
{$IFDEF USE_NEW_AUTH}
    AppProcID := AppStart('Diagnost.exe', IntToStr(odsList.FieldByName('FK_PACID').AsInteger));
    if AppProcID = -1 then ShowMessage('Ошибка запуска приложения');
{$ELSE}
  if ShellExecute(Application.Handle,
                  pChar('open'),
                  PChar(ExtractFilePath(paramstr(0)) + 'Diagnost.exe'),
                  PChar(IntToStr(pAPPSOTRID) + ' ' +
                  IntToStr(odsList.FieldByName('FK_PACID').AsInteger)), PChar(ExtractFilePath(paramstr(0))), SW_SHOWNORMAL) < 32 then
  Application.MessageBox('Запуск внешнего модуля не удался.', 'Ошибка', MB_OK + MB_ICONERROR);
{$ENDIF}
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
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select to_char(sysdate, ''dd.mm.yyyy hh24:mi'') as systemdate from dual ';
    ods.Open;
    GET_SYSDATE_4REP := ods.FieldByName('systemdate').AsString;
  finally
    ods.Free;
  end;
  if get_dbname = 'MC' then // для Междуреченска
    begin
      rListMGR.ShowReport;
      exit;
    end;
  frxPrintList.ShowReport;
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
    ods.SQL.Text := ' SELECT TO_CHAR(SYSDATE, ''DD.MM.YYYY HH24:MI'') AS SYSTEMDATE '+#13+
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
    str2 : TStringList;
begin
  if (get_dbname = 'SO') or (get_dbname = 'SK') or (get_dbname = 'MC') or (get_dbname = 'TM') then // для Сургут ОКБ, Кардио, Междуреченск, Томск
    begin
      DoResultHTML(odsList.FieldByName('fk_id').AsInteger, odsList.FieldByName('fk_pacid').AsInteger); // формируем в HTML
    end else
    begin
      ods := TOracleDataSet.Create(nil);
      mem := TMemoryStream.Create;
      str2 := TStringList.Create;
      try
        ods.Session := os;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' select (select fb_html from asu.trichviewdata where fk_pacid = :pfk_pacid) as fb_text, '+#13+
                        '        (select fc_phone from asu.tkabinet where fk_id = :pfk_id) as fc_phone '+#13+
                        '   from dual ';
        ods.DeclareAndSet('PFK_PACID', otInteger, odsList.FieldByName('FK_ID').AsInteger);
        ods.DeclareAndSet('PFK_ID', otInteger, odsList.FieldByName('FK_ROOMID').AsInteger);
        ods.Open;

        RvHtmlImporter1.LoadHtml(ods.FieldByName('FB_TEXT').AsString); // формируем основной текст протокола
        rve1.SaveRTFToStream(mem, false);
        mem.Position := 0;
        str2.LoadFromStream(mem);
        mem.Clear;
        rve1.Clear;
        rve1.Reformat;
        sTextIssl_4Rep := str2.Text;
        sPhone_4Rep := ods.FieldByName('FC_PHONE').AsString;
        is_digsig := get_digsig = '1';
        if get_dbname = 'T' then
          begin
            ods.DeleteVariables;
            ods.Close;
            ods.SQL.Text := ' select decode(tsotr.fl_zav_otd, 0, ts_sprav.fc_name, 1, ''Зав. отд. '' || lower(ts_sprav.fc_name)) as fc_name '+#13+
                            '   from asu.ts_sprav, asu.tsotr '+#13+
                            '  where tsotr.fk_spravid = ts_sprav.fk_id and tsotr.fk_id = :pfk_id ';
            ods.DeclareAndSet('pfk_id', otInteger, odsList.FieldByName('fk_ispolid').AsInteger);
            ods.Open;
            sSpec_4Rep := ods.FieldByName('fc_name').AsString;
            frxRepProsmotr_Travma.FindObject('MemTelCaption').Visible := sPhone_4Rep <> '';
            frxRepProsmotr_Travma.ShowReport;
            exit;
          end;
        if get_dbname = 'TO' then
          begin
            rProt_TO.FindObject('MemTelCaption').Visible := sPhone_4Rep <> '';
            rProt_TO.ShowReport;
            exit;
          end;
        frxRepProsmotr.FindObject('MemTelCaption').Visible := sPhone_4Rep <> '';
        frxRepProsmotr.ShowReport;
      finally
        mem.Free;
        str2.Free;
        ods.Free;
      end;
  end;
end;

procedure TfrmMain.DoRefreshSmidConst;
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
	  ods.SQL.Text := ' SELECT asu.get_neyav, ASU.GET_NAZCANCEL, ASU.GET_VIPNAZ, ASU.GET_NAZPLAN, ASU.GET_NEVIP, ASU.GET_RECOMEND, '+#13+
                    '        ASU.GET_ISSLEDID, TRUNC(SYSDATE) AS SYSTEMDATE, '+#13+
                    '        (SELECT FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''CONFIG'' AND FC_KEY = ''USE_DIGITSUBSCRIBE'') AS DIGSIG, '+#13+
                    '        ASU.PKG_SMINI.READSTRING(''CONFIG'', ''DB_NAME'', ''H'') AS DB_NAME '+#13+
                    '   FROM DUAL ';
    ods.Close;
    ods.Open;

    try
      listdiagnost_addnazshowanal := TDBUtils.GetConstantDef('listdiagnost_addnazshowanal',os,1);
    except
      listdiagnost_addnazshowanal := 1;
    end;

    try
      LIST_PATANAT_PROSMOTR_HTML := tdbutils.getconstantdef('LIST_PATANAT_PROSMOTR_HTML',os,0);
    except
      LIST_PATANAT_PROSMOTR_HTML := 0;
    end;                

    get_neyav := ods.FieldByName('get_neyav').AsInteger;
    get_nazcancel := ods.FieldByName('GET_NAZCANCEL').AsInteger;
    get_vipnaz := ods.FieldByName('GET_VIPNAZ').AsInteger;
    get_nazplan := ods.FieldByName('GET_NAZPLAN').AsInteger;
    get_nevip := ods.FieldByName('GET_NEVIP').AsInteger;
	  get_recomend := ods.FieldByName('GET_RECOMEND').AsInteger;
    get_issledid := ods.FieldByName('GET_ISSLEDID').AsInteger;
	  get_systemdate := ods.FieldByName('SYSTEMDATE').AsDateTime;
    get_digsig := ods.FieldByName('DIGSIG').AsString;
    get_dbname := ods.FieldByName('DB_NAME').AsString;
    if get_dbname = 'SK' then
     beichbTypePac.Visible := ivAlways
    else
     beichbTypePac.Visible := ivNever;  
//-- tsmini
    dicom_show_3d := True; // по умолчанию не включаем 3D
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' select fc_value, fc_key from asu.tsmini where fc_section = ''XRAY'' order by fk_id ';
    ods.Open;
    ods.First;
    while not ods.Eof do
      begin
        if ods.FieldByName('fc_key').AsString = 'SHOW_DICOM' then
          begin
            if ods.FieldByName('fc_value').AsString = '' then
              get_dicom_show := '0'
            else
              get_dicom_show := ods.FieldByName('fc_value').AsString;
          end;
        if ods.FieldByName('fc_key').AsString = 'DICOM_PORT' then
          begin
            get_dicom_port := ods.FieldByName('fc_value').AsString;
          end;
        if ods.FieldByName('fc_key').AsString = 'DICOM_IP' then
          begin
            get_dicom_ip := ods.FieldByName('fc_value').AsString;
          end;
        if ods.FieldByName('fc_key').AsString = 'DICOM_CALLED_AE' then
          begin
            get_dicom_called := ods.FieldByName('fc_value').AsString;
          end;
        if ods.FieldByName('fc_key').AsString = 'DICOM_SHOW_3D' then // Показывать кнопку "Включить 3D"
          begin
            if ods.FieldByName('fc_value').AsString = '-1' then // обратная логика если True, то не показываем 3D 
              dicom_show_3d := False
            else
              dicom_show_3d := True;
          end;
        ods.Next;
      end;
    list_visible_row_allkabinet := TDBUtils.GetConstantDef('list_visible_row_allkabinet',os,0);
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.aArchiveExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmArchive, frmArchive);
  try
    frmArchive.ShowModal;
  finally
    frmArchive.Free;
  end;
end;

procedure TfrmMain.aCancelExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmOtmena, frmOtmena);
  try
    frmOtmena.DoShowfrmOtmena(odsList.FieldByName('FK_PACID').AsInteger, pSOTRID);
    frmOtmena.ShowModal;
    if frmOtmena.ModalResult = MrOK then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' UPDATE ASU.VNAZ SET FK_ISPOLID = :pFK_ISPOLID, FK_NAZSOSID = :pFK_NAZSOSID WHERE FK_ID = :pFK_ID ';
          oq.DeclareAndSet('pFK_ISPOLID', otInteger, pSOTRID);
          oq.DeclareAndSet('pFK_NAZSOSID', otInteger, GET_NAZCANCEL);
          oq.DeclareAndSet('pFK_ID', otInteger, odsList.FieldByName('FK_ID').AsInteger);
          oq.Execute;
          os.Commit;
          oq.DeleteVariables;
          oq.SQL.Text := ' INSERT INTO ASU.VRES(FK_SMID, FD_INS, FC_RES, FC_TYPE, FK_VRACHID, FK_PACID, FK_NAZID, FK_SOS) '+
                         ' VALUES(:pFK_SMID, SYSDATE, :pFC_RES, ''TEXT'', :pFK_VRACHID, :pFK_PACID, :pFK_NAZID, :pFK_SOS) ';
          oq.DeclareAndSet('pFK_SMID', otInteger, odsList.FieldByName('FK_SMID').AsInteger);
          oq.DeclareAndSet('pFC_RES', otString, frmOtmena.cxOtmena.Text+';'+frmOtmena.cxOtmenaHand.Text);
          oq.DeclareAndSet('pFK_VRACHID', otInteger, pSOTRID);
          oq.DeclareAndSet('pFK_PACID', otInteger, odsList.FieldByName('FK_PACID').AsInteger);
          oq.DeclareAndSet('pFK_NAZID', otInteger, odsList.FieldByName('FK_ID').AsInteger);
          oq.DeclareAndSet('pFK_SOS', otInteger, GET_NAZCANCEL);
          oq.Execute;
          os.Commit;
          RefreshQuery(odsList);
        finally
          oq.Free;
        end;
      end;
  finally
    frmOtmena.Free;
  end;
end;

procedure TfrmMain.aCDExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmCD, frmCD);
  frmCD.DoShowForm(get_dicom_ip,
                   get_dicom_port,
                   get_dicom_called,
                   sCallingAET,
                   odsList.FieldByName('fiopac').AsString,
                   os,
                   odsList.FieldByName('fk_id').AsInteger,
                   odsList.FieldByName('fd_run').AsDateTime,
                   2);
  try
    frmCD.ShowModal;
  finally
    frmCD.Free;
  end;
end;

procedure TfrmMain.odsListAfterScroll(DataSet: TDataSet);
begin
  CheckEnabledButons;
// -- показывать или не показывать кнопку "снимки"
  if (frmMain.get_dbname = 'H') or (frmMain.get_dbname = 'SO') then
    begin
      if frmMain.get_dicom_show = '-1' then
        begin
          if odsList.FieldByName('fk_resultid').AsInteger = 1 then
            begin
              aSnimok.Visible := True;
              aCD.Visible := True;
            end else
            begin
              aSnimok.Visible := False;
              aCD.Visible := False;
            end;
        end else
        begin
          aSnimok.Visible := False;
          aCD.Visible := False;
        end;
    end else
    begin
      if frmMain.get_dicom_show = '-1' then
        begin
          if odsList.FieldByName('fk_resultid').AsInteger = 1 then
            begin
              aSnimok.Visible := True;
              aCD.Visible := True;
            end else
            begin
              aSnimok.Visible := False;
              aCD.Visible := False;
            end;
        end else
        begin
          aSnimok.Visible := False;
          aCD.Visible := False;
        end;
    end;  
end;

procedure TfrmMain.CheckEnabledButons;
begin
  aInfo.Enabled := (odsList.RecordCount <> 0);
  aOpen.Enabled := odsList.RecordCount <> 0;
  aFill.Enabled := (odsList.RecordCount <> 0)
                    and ((odsList.FieldByName('FK_NAZSOSID').AsInteger = GET_NEVIP) or (odsList.FieldByName('FK_NAZSOSID').AsInteger = GET_RECOMEND));
  aCancel.Enabled := (odsList.RecordCount <> 0)
                      and ((odsList.FieldByName('FK_NAZSOSID').AsInteger = GET_NEVIP) or (odsList.FieldByName('FK_NAZSOSID').AsInteger = GET_RECOMEND));
  aPreview.Enabled := (odsList.RecordCount <> 0) and (odsList.FieldByName('FK_NAZSOSID').AsInteger = GET_VIPNAZ);

  aEdit.Enabled := (odsList.RecordCount <> 0) and
                   (odsList.FieldByName('fk_nazsosid').AsInteger = GET_VIPNAZ) and
                   (odsList.FieldByName('fk_nazsosid').AsInteger <> GET_NAZCANCEL) and
                   (odsList.FieldByName('fk_nazsosid').AsInteger <> get_neyav) and
                   (odsList.FieldByName('fk_ispolid').AsInteger = pSotrID);
  aEditNaz.Enabled := (odsList.RecordCount <> 0)
                       and ((odsList.FieldByName('FK_NAZSOSID').AsInteger = GET_NEVIP) or (odsList.FieldByName('FK_NAZSOSID').AsInteger = GET_RECOMEND));
  aPrint.Enabled := odsList.RecordCount <> 0;
  aProsmotr.Enabled := odsList.FieldByName('FK_NAZSOSID').AsInteger = GET_VIPNAZ;

  aEditType.Enabled := odsList.RecordCount <> 0;
  aMs.Enabled := odsList.RecordCount <> 0;
  aNaz.Enabled := odsList.RecordCount <> 0;
  aSysInfo.Enabled := odsList.RecordCount <> 0;
  aEditIssl.Enabled := (odsList.RecordCount <> 0) and (odsList.FieldByName('FK_NAZSOSID').AsInteger <> GET_VIPNAZ);
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
	if odsList.RecordCount <> 0 then
	begin
	if odsList.FieldByName('FK_NAZSOSID').AsInteger = GET_NAZCANCEL then
		begin
			Application.CreateForm(TfrmOtmena, frmOtmena);
			frmOtmena.acOk.Visible := FALSE;
      frmOtmena.GroupBox1.Visible := FALSE;
      frmOtmena.cxOtmena.Align := alClient;
      frmOtmena.acCancel.ImageIndex := 2;
			frmOtmena.acCancel.Caption := 'Закрыть';
			ods := TOracleDataSet.Create(nil);
			try
				ods.Session := os;
				ods.Cursor := crSQLWait;
				ods.SQL.Text := ' SELECT FC_RES, FD_INS, FK_VRACHID, ASU.DO_VRACHFIO(FK_VRACHID) AS VRACHFIO '+
                        '   FROM ASU.VRES WHERE FK_NAZID = :pFK_NAZID AND FK_SOS = ASU.GET_NAZCANCEL ';
				ods.DeclareAndSet('pFK_NAZID', otInteger, odsList.FieldByName('FK_ID').AsInteger);
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
			    if (odsList.FieldByName('FK_NAZSOSID').AsInteger <> GET_VIPNAZ) and (odsList.FieldByName('fk_nazsosid').AsInteger <> get_neyav) then
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
  if AViewInfo.GridRecord.Values[TVSOS.Index] = get_neyav then
    ACanvas.Brush.Color:=RGB(251, 172, 182);
  if AViewInfo.GridRecord.Values[TVFK_NAZTYPE.Index] <> GET_NAZPLAN then
    ACanvas.Font.Style := [fsBold];
end;

procedure TfrmMain.TVListFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  if odsList.recordcount > 0 then
  if get_dbname = 'SO' then
    with TOracleDataSet.create(nil) do
     begin
       try
         session := os;
         sql.text := 'select 1 from asu.tsmid where fc_synonim = ''I_PATGIST_ENDO'' and fk_id = :pid';
         declareandset('pid',otinteger,odsList.FieldByName('fk_smid').asinteger);
         open;
         if recordcount > 0 then
          begin
            aProsmotr.OnExecute := DoShowPatogistNapr;
          end
         else
          begin
            aProsmotr.OnExecute := aProsmotrExecute;
          end;
       finally
         free;
       end;
     end
  else
   aProsmotr.OnExecute := aProsmotrExecute;
end;

procedure TfrmMain.N2Click(Sender: TObject);
begin
  TVList.RestoreFromRegistry('\SoftWare\SoftMaster\List_Diagnost\cxGrVrach_' + IntToStr(pSOTRID)+'Default', FALSE, FALSE, [], 'cxGr');
  VListTypePriem.Visible := get_dbname = 'SK';
  VListVidOpl.Visible := (get_dbname = 'SK') or (get_dbname <> 'MC');
  VListStatusKart.Visible := get_dbname = 'SK';
  VListStatusTalon.Visible := get_dbname = 'SK';
  VListTypePriem.Hidden := get_dbname <> 'SK';
  VListVidOpl.Hidden := (get_dbname <> 'SK') or (get_dbname <> 'MC');
  VListStatusKart.Hidden := get_dbname <> 'SK';
  VListStatusTalon.Hidden := get_dbname <> 'SK';
end;

procedure TfrmMain.odsKabBeforeOpen(DataSet: TDataSet);
begin
  odsKab.SetVariable('PSOTR', pSOTRID);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var Ini : TIniFile;
begin
  Ini := TIniFile.Create(ExtractFilePath(paramstr(0))+'DicomSettings.ini');
  try
    sCallingAET := Ini.ReadString('MAIN', 'CALLING_AET', 'MEDOTRADE');
  finally
    Ini.Free;
  end;
  {$IFDEF USE_NEW_AUTH}
    GetSession(os, 'ASU');
  {$ELSE}
    os.LogonUsername := 'ASU';
    os.LogonPassword := 'ASU';
    os.LogonDatabase := 'ASU';
    os.Connected:=True;
  {$ENDIF}  
  gDigSignature := TDigitalSignature.Create(Self);
  russian:=LoadKeyboardLayout('00000419', 0);
  Application.HelpFile:=ExtractFilePath(Application.ExeName)+'Spiski.chm';
  Self.WindowState := wsMaximized;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  FreeAndNil(gDigSignature);
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
//dxBarControlContainerItem1.
end;

procedure TfrmMain.beichbTypePacPropertiesChange(Sender: TObject);
begin
  aRefreshExecute(nil);
end;

procedure TfrmMain.blMonClick(Sender: TObject);
var mm,yy,dd:word;
begin
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
end;

procedure TfrmMain.blWeeksClick(Sender: TObject);
begin
  dxdeDate.EditValue:=dxdeDate.EditValue-1;
end;

procedure TfrmMain.p1Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(dxdeDate.EditValue);
  if wd=1 then wd:=8;
  dxdeDate.EditValue:=dxdeDate.EditValue-wd+2;
end;

procedure TfrmMain.p2Click(Sender: TObject);
var
 wd:integer;
begin
  wd:=dayofweek(dxdeDate.EditValue);
  if wd=1 then wd:=8;
  dxdeDate.EditValue:=dxdeDate.EditValue-wd+3;
end;

procedure TfrmMain.p3Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(dxdeDate.EditValue);
  if wd=1 then wd:=8;
  dxdeDate.EditValue:=dxdeDate.EditValue-wd+4;
end;

procedure TfrmMain.p4Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(dxdeDate.EditValue);
  if wd=1 then wd:=8;
  dxdeDate.EditValue:=dxdeDate.EditValue-wd+5;
end;

procedure TfrmMain.p5Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(dxdeDate.EditValue);
  if wd=1 then wd:=8;
  dxdeDate.EditValue:=dxdeDate.EditValue-wd+6;
end;

procedure TfrmMain.p6Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(dxdeDate.EditValue);
  if wd=1 then wd:=8;
  dxdeDate.EditValue:=dxdeDate.EditValue-wd+7;
end;

procedure TfrmMain.p7Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(dxdeDate.EditValue);
  if wd=1 then wd:=8;
  dxdeDate.EditValue:=dxdeDate.EditValue-wd+8;
end;

procedure TfrmMain.brWeeksClick(Sender: TObject);
begin
  dxdeDate.EditValue:=dxdeDate.EditValue+1;
end;

procedure TfrmMain.brMonClick(Sender: TObject);
var yy,mm,dd:word;
begin
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
end;

procedure TfrmMain.DateChange;
var
 yy,mm,dd:word;
 wd:integer;
// pDate:tDateTime;
begin
//  pDate:=dxdeDate.Date;
  pMonth.Caption:=FormatDateTime('mmmm',dxdeDate.EditValue)+', '+(FormatDateTime('dddd',dxdeDate.EditValue));

  wd:=dayofweek(dxdeDate.EditValue);
  if wd=1 then wd:=8;
//  pDate:=dxdeDate.Date;

//  pDate:=dxdeDate.Date-wd+2;
  decodeDate(dxdeDate.EditValue-wd+2,yy,mm,dd);
  p1.Caption:=inttostr(dd);

//  pDate:=dxdeDate.Date-wd+3;
  decodeDate(dxdeDate.EditValue-wd+3,yy,mm,dd);
  p2.Caption:=inttostr(dd);

//  pDate:=dxdeDate.Date-wd+4;
  decodeDate(dxdeDate.EditValue-wd+4,yy,mm,dd);
  p3.Caption:=inttostr(dd);

//  pDate:=dxdeDate.Date-wd+5;
  decodeDate(dxdeDate.EditValue-wd+5,yy,mm,dd);
  p4.Caption:=inttostr(dd);

//  pDate:=dxdeDate.Date-wd+6;
  decodeDate(dxdeDate.EditValue-wd+6,yy,mm,dd);
  p5.Caption:=inttostr(dd);

//  pDate:=dxdeDate.Date-wd+7;
  decodeDate(dxdeDate.EditValue-wd+7,yy,mm,dd);
  p6.Caption:=inttostr(dd);

//  pDate:=dxdeDate.Date-wd+8;
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

procedure TfrmMain.aPreviewExecute(Sender: TObject);
begin
  DoResult(odsList.FieldByName('fk_id').AsInteger);
end;

procedure TfrmMain.DoResult(nNazID: Integer);
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
    oq.SQL.Add('  dbms_lob.createtemporary(:html, TRUE, dbms_lob.SESSION); ');
    oq.SQL.Add('  dbms_lob.WRITE(:html,1,1,'' ''); ');
    oq.SQL.Add('  :html := STAT.PKG_IBXML.GET_HTM_OSM('+IntToStr(IDRes)+'); ');
    oq.SQL.Add(' end; ');
    oq.Open;

    lob := TLOBLocator(oq.GetComplexVariable('html'));
    lob.SaveToFile(ExtractFilePath(paramstr(0))+inttostr(odsList.FieldByName('FK_PACID').AsInteger) +'print.htm');
    frmPreview.wb.Navigate(ExtractFilePath(paramstr(0))+inttostr(odsList.FieldByName('FK_PACID').AsInteger) +'print.htm');
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
        DoPrintDocument(ExtractFilePath(paramstr(0))+inttostr(odsList.FieldByName('FK_PACID').AsInteger) +'print.htm',
                        frmPreview.bbFormat.ItemIndex);
        try
          DeleteFile(ExtractFilePath(paramstr(0))+inttostr(odsList.FieldByName('FK_PACID').AsInteger) +'print.htm');
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
          DeleteFile(ExtractFilePath(paramstr(0))+inttostr(odsList.FieldByName('FK_PACID').AsInteger) +'print.htm');
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

procedure TfrmMain.DoResultHTML(nNazID: Integer; nPacID: Integer);
var oq : TOracleDataSet;
    ods : TOracleDataSet;
    LOB : TLOBLocator;
    IDRes : Integer;
    RegSave, RegLoad : TRegIniFile;
    aBeforePrintCallBack: TBeforePrintCallBack;
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
    if list_diagnost_use_beiKolvoCopy = 1 then
     begin
      frmPreview.beiKolvoCopy.Visible := ivAlways;
      frmPreview.beiKolvoCopy.EditValue := list_diagnost_beiKolvoCopy_def;
     end
    else
     frmPreview.beiKolvoCopy.Visible := ivNever;
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
    if get_dbname = 'SK' then
     begin
      oq.SQL.Add('  :html := asu.GET_HTM_OSM_KOLYA('+IntToStr(IDRes)+', :pBase); ');
      oq.DeclareAndSet('pBase', otString, get_dbname);
     end
    else
     oq.SQL.Add('  :html := asu.GET_HTM_OSM_KOLYA('+IntToStr(IDRes)+'); ');
    oq.SQL.Add(' end; ');
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
        if list_diagnost_use_beiKolvoCopy = 1 then
         DoPrintDocument(ExtractFilePath(paramstr(0))+inttostr(nPacID) +'print.htm',
                         frmPreview.bbFormat.ItemIndex,false,false,aBeforePrintCallBack,
                         integer(frmPreview.beiKolvoCopy.EditValue))
        else
         DoPrintDocument(ExtractFilePath(paramstr(0))+inttostr(nPacID) +'print.htm',
                         frmPreview.bbFormat.ItemIndex);
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
      if trim(StrPas(buff)) = trim(AAppCaption) then
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

procedure TfrmMain.rProt_TOGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := sOtdelName_4Rep;
  if VarName = 'PACAGE' then Value := odsList.FieldByName('AGE').AsInteger;
  if VarName = 'PACFIO' then Value := odsList.FieldByName('FIOPAC').AsString;
  if VarName = 'RUNDATE' then Value := odsList.FieldByName('FD_RUN_STR').AsString;
  if VarName = 'ISSLNAME' then Value := odsList.FieldByName('FC_NAME').AsString;
  if VarName = 'ISSLTEXT' then Value := sTextIssl_4Rep;
  if is_digsig = True then
    begin
      if VarName = 'SOTRNAME' then Value := 'ЭЦП '+odsList.FieldByName('ISPOLFIO').AsString
    end else
    begin
      if VarName = 'SOTRNAME' then Value := odsList.FieldByName('ISPOLFIO').AsString;
    end;
  if VarName = 'PHONEKAB' then Value := sPhone_4Rep;
  if VarName = 'MEDOTRADESIGN' then Value := MedotradeSign;
end;

procedure TfrmMain.SetDesignApplication;
var
    SkinName: string;
begin
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
           flgNewDesign := True
        else
           flgNewDesign := False;
        if flgNewDesign then
        begin
            SkinName := uGlobalConst.ReadUserSkinName(N_SOTR_PEPLID);
 
            if length(SkinName) = 0 then
                SkinName := 'Medotrade'; //'LondonLiquidSky';
            SetSkin(SkinName);
        end
        else
        begin
            dxSkinController.SkinName := '';
            dxSkinController.UseSkins := False;
            cxLookAndFeelController.SkinName := '';
            bm.LookAndFeel.SkinName := '';
        end;
    end
    else
    begin
        dxSkinController.SkinName := '';
        dxSkinController.UseSkins := False;
        cxLookAndFeelController.SkinName := '';
        bm.LookAndFeel.SkinName := '';
    end;
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
 
        dxSkinController.SkinName := 'UserSkin';
        dxSkinController.UseSkins := True;
        cxLookAndFeelController.SkinName := 'UserSkin';
        bm.LookAndFeel.SkinName := 'UserSkin';
 
    end;
 
    FreeAndNil(AResNameList);
    FreeAndNil(ASkinNameList);
end;

procedure TfrmMain.aEditNazExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmEditNaz, frmEditNaz);
  try
    frmEditNaz.DoShowEditNaz(odsList.FieldByName('FK_PACID').AsInteger,
                             pSOTRID,
                             odsList.FieldByName('PEPLID').AsInteger,
                             odsList.FieldByName('VRACHFIO').AsString,
                             Trunc(odsList.FieldByName('FD_RUN').AsDateTime),
                             odsList.FieldByName('FK_ROOMID').AsInteger,
                             odsList.FieldByName('FK_SMID').AsInteger,
                             odsList.FieldByName('FK_ID').AsInteger);
    frmEditNaz.ShowModal;
    if frmEditNaz.ModalResult = MrOK then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' UPDATE TNAZIS SET FD_RUN = :PFD_RUN, FK_ROOMID = :PFK_ROOMID WHERE FK_ID = :PFK_ID ';
          oq.DeclareAndSet('PFD_RUN', otDate, StrToDateTime(DateToStr(frmEditNaz.cxdeDate.Date)+' '+FormatDateTime('hh:nn:ss', frmEditNaz.cxteTime.Time)));
          oq.DeclareAndSet('PFK_ROOMID', otInteger, frmEditNaz.cxlcKabinet.EditValue);
          oq.DeclareAndSet('PFK_ID', otInteger, odsList.FieldByName('FK_ID').AsInteger);
          oq.Execute;
          os.Commit;
          RefreshQuery(odsList);
        finally
          oq.Free;
        end;
      end;
  finally
    frmEditNaz.Free;
  end;
end;

procedure TfrmMain.aEditTypeExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmEditType, frmEditType);
  try
    frmEditType.lcbType.EditValue := odsList.FieldByName('FK_NAZTYPEID').AsInteger;
    frmEditType.ShowModal;
    if frmEditType.ModalResult = mrOk then
      begin
        if odsList.FieldByName('FK_NAZTYPEID').AsInteger <> frmEditType.lcbType.EditValue then // если значение изменилось
          begin
            oq := TOracleQuery.Create(nil);
            try
              oq.Session := os;
              oq.Cursor := crSQLWait;
              oq.SQL.Text := ' UPDATE ASU.TNAZIS SET FK_NAZTYPEID = :PFK_NAZTYPEID WHERE FK_ID = :PFK_ID ';
              oq.DeclareAndSet('PFK_NAZTYPEID', otInteger, frmEditType.lcbType.EditValue);
              oq.DeclareAndSet('PFK_ID', otInteger, odsList.FieldByName('FK_ID').AsInteger);
              oq.Execute;
              os.Commit;
              RefreshQuery(odsList);
            finally
              oq.Free;
            end;
          end;
      end;
  finally
    frmEditType.Free;
  end; 
end;

procedure TfrmMain.aInfoExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmPacInfoDiagnost, frmPacInfoDiagnost);
  try
    frmPacInfoDiagnost.DoShowPacInfo(odsList.FieldByName('FK_PACID').AsInteger,
                                     odsList.FieldByName('PEPLID').AsInteger,
                                     odsList.FieldByName('VRACHFIO').AsString);
    frmPacInfoDiagnost.ShowModal;
  finally
    frmPacInfoDiagnost.Free;
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

procedure TfrmMain.aNazExecute(Sender: TObject);
var oq : TOracleQuery;
    id, idPac, idNaz : Integer;
begin
  idPac := odsList.FieldByName('FK_PACID').AsInteger;
  Application.CreateForm(TfrmNaz, frmNaz);
  try
    frmNaz.DoShowForm(odsList.FieldByName('FIOPAC').AsString,
                      odsList.FieldByName('FD_ROJD').AsDateTime,
                      odsList.FieldByName('AGE').AsInteger,
                      odsList.FieldByName('SEX').AsString,
                      odsList.FieldByName('FK_PACID').AsInteger);
    frmNaz.ShowModal;
    if frmnaz.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' insert into asu.tnazis(fk_smid, fd_naz, fd_run, fk_roomid, fk_vrachid, fk_ispolid, fk_nazsosid, fk_pacid, fc_name, fk_naztypeid) '+#13+
                         ' values(:pfk_smid, :pfd_naz, :pfd_run, :pfk_roomid, :pfk_vrachid, :pfk_ispolid, asu.get_nevip, :pfk_pacid, :pfc_name, :pfk_naztypeid) '+#13+
                         ' returning fk_id into :pfk_id ';
          oq.DeclareVariable('pfk_id', otInteger);
          oq.DeclareAndSet('pfk_smid', otInteger, frmNaz.odsNaz.FieldByName('fk_smid').AsInteger);
          oq.DeclareAndSet('pfd_naz', otDate, StrToDateTime(DateToStr(frmNaz.merDateTime.Properties.Editors[0].Value)+' '+FormatDateTime('hh:nn:ss', frmNaz.merDateTime.Properties.Editors[1].Value)));
          oq.DeclareAndSet('pfd_run', otDate, StrToDateTime(DateToStr(frmNaz.merDateTime.Properties.Editors[0].Value)+' '+FormatDateTime('hh:nn:ss', frmNaz.merDateTime.Properties.Editors[1].Value)));
          oq.DeclareAndSet('pfk_roomid', otInteger, frmNaz.rowKab.Properties.Value);
          oq.DeclareAndSet('pfk_vrachid', otInteger, pSotrID);
          oq.DeclareAndSet('pfk_ispolid', otInteger, pSotrID);
          oq.DeclareAndSet('pfk_pacid', otInteger, odsList.FieldByName('fk_pacid').AsInteger);
          oq.DeclareAndSet('pfc_name', otString, frmNaz.odsNaz.FieldByName('namenaz').AsString);
          oq.DeclareAndSet('pfk_naztypeid', otInteger, frmNaz.rowType.Properties.Value);
          oq.Execute;
          os.Commit;
          idNaz := oq.GetVariable('pfk_id');
          if odsList.FieldByName('is_amb').asInteger = 1 then
            begin
              if get_dbname <> 'SK' then
                begin
                  id := GetLastTalonID(Application.Handle, os, odsList.FieldByName('fk_pacid').AsInteger, pSOTRID, -1);
                  if id <> 0 then
                    begin
                      oq.DeleteVariables;
                      oq.SQL.Text := ' INSERT INTO ASU.TAMBTALON_NAZ(FK_TALONID, FK_AMBID, FK_NAZID) '+#13+
                                     ' VALUES(:PFK_TALONID, :PFK_AMBID, :PFK_NAZID) ';
                      oq.DeclareAndSet('PFK_TALONID', otInteger, id);
                      oq.DeclareAndSet('PFK_AMBID', otInteger, idPac);
                      oq.DeclareAndSet('PFK_NAZID', otInteger, idNaz);
                      oq.Execute;
                      os.Commit;
                    end;
                end else
                begin // для Сургут кардио
                  // талон
                  oq.DeleteVariables;
                  oq.SQL.Text := ' insert into asu.tambtalon(fk_sotrid, fd_opened, fk_ambid, fk_insuranceid) '+#13+
                                 ' values(:pfk_sotrid, sysdate, :pfk_ambid, (select fk_insurdocid from asu.tpac_insurance where fk_pacid = :pfk_ambid)) '+#13+
                                 ' returning fk_id into :pfk_id ';
                  oq.DeclareAndSet('pfk_sotrid', otInteger, pSOTRID);
                  oq.DeclareAndSet('pfk_ambid', otInteger, odsList.FieldByName('fk_pacid').AsInteger);
                  oq.DeclareVariable('pfk_id', otInteger);
                  oq.Execute;
                  id := oq.GetVariable('pfk_id');
                  oq.DeleteVariables;
                  // связка талона и назначения
                  oq.SQL.Text := ' insert into asu.tambtalon_naz(fk_talonid, fk_ambid, fk_nazid) '+#13+
                                 ' values(:pfk_talonid, :pfk_ambid, :pfk_nazid) ';
                  oq.DeclareAndSet('pfk_talonid', otInteger, id);
                  oq.DeclareAndSet('pfk_ambid', otInteger, idPac);
                  oq.DeclareAndSet('pfk_nazid', otInteger, idNaz);
                  oq.Execute;
                  oq.DeleteVariables;
                  // связка с tkonsult_uslug
                  oq.SQL.Text := ' insert into asu.tkonsult_uslug(fk_nazid) values(:pfk_nazid) ';
                  oq.DeclareAndSet('pfk_nazid', otInteger, idNaz);
                  oq.Execute;
                  oq.DeleteVariables;
                  // добавляем направившее учреждение = "самообращение"
                  oq.SQL.Text := ' insert into asu.tib(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                                 ' values(:pfk_pacid, asu.get_self_napr, asu.get_owner_from_smid(asu.get_self_napr), :pfk_vrachid, sysdate) ';
                  oq.DeclareAndSet('pfk_pacid', otInteger, id);
                  oq.DeclareAndSet('pfk_vrachid', otInteger, pSOTRID);
                  oq.Execute;
                  os.Commit;
                end;
            end;
          RefreshQuery(odsList);
        finally
          oq.Free;
        end;
      end;
  finally
    frmNaz.Free;
  end;
end;

procedure TfrmMain.aEditExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select sysdate - fd_date as raz, '+#13+
                    '        to_char(fd_date, ''dd.mm.yyyy hh24:mi'') as fd_date_str '+#13+
                    '   from asu.tpodpisnaz '+#13+
                    '  where fk_nazid = :pfk_nazid and fk_sos = asu.get_vipnaz ';
    ods.DeclareAndSet('pfk_nazid', otInteger, dsList.DataSet.FieldByName('fk_id').AsInteger);
    ods.Open;
    if get_dbname = 'SK' then
      begin
        if ods.FieldByName('raz').AsInteger > 31 then
          begin
            MessageDlg('С момента первой подписи протокола прошло более 31 суток! Изменить протокол невозможно!'
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
            MessageDlg('С момента первой подписи протокола прошло более суток! Изменить протокол невозможно!'
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
  HandleDLL := LoadLibrary('PriemDll.dll');
  if HandleDLL <> 0 then
    begin
      EditPlugin_Personal := GetProcAddress(HandleDLL, 'EditPlugin_Personal');
      if @EditPlugin_Personal <> nil then
      begin
        try
          @SetSignFnc := GetProcAddress(HandleDLL, 'SetSignFnc');
          if Assigned(@SetSignFnc) then
            SetSignFnc(frmMain.gDigSignature.SignDocument);
					EditPlugin_Personal(Panel1.Handle, //хэндл панели
															Application.Handle, //хэндл аппликейшена
															odsList.FieldByName('FK_PACID').AsInteger, //код пациента
															pSOTRID, //код сотрудника
															pAPPSOTRID, //специализация
															-1, //секция
															odsList.FieldByName('FK_SMID').AsInteger, //смид
															odsList.FieldByName('FK_ID').AsInteger, //назид
															FALSE,
															odsList.FieldByName('FK_ID').AsInteger, //ид объекта
															Panel1.Parent.Handle);
        except
        end;
      end;
    end;
  try
    Application.ProcessMessages;
    FreeLibrary(HandleDLL);
    HandleDll:=0;
  except
  end;
  RefreshQuery(odsList);
end;

procedure TfrmMain.aEditIsslExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  if IsPaidNaz(frmMain.os, odsList.FieldByName('fk_id').AsInteger) then
  begin
    MessageDlg('Назначение уже оплачено. Изменение невозможно', mtWarning, [mbOK], 0);
    exit;
  end;
  
  Application.CreateForm(TfrmUpdateNaz, frmUpdateNaz);
  try
    frmUpdateNaz.ShowModal;
    if frmUpdateNaz.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := frmMain.os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' update asu.vnaz '+#13+
                         '    set fk_smid = :pfk_smid, fc_name = :pfc_name '+#13+
                         '  where fk_id = :pfk_id ';
          oq.DeclareAndSet('pfk_smid', otInteger, frmUpdateNaz.odsList.FieldByName('fk_smid').AsInteger);
          oq.DeclareAndSet('pfc_name', otString, frmUpdateNaz.odsList.FieldByName('fc_name').AsString);
          oq.DeclareAndSet('pfk_id', otInteger, odsList.FieldByName('fk_id').AsInteger);
          oq.Execute;
          frmMain.os.Commit;
          RefreshQuery(odsList);
        finally
          oq.Free;
        end;
      end;
  finally
    frmUpdateNaz.Free;
  end;
end;

procedure TfrmMain.aSearchExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmSearch, frmSearch);
  try
    frmSearch.DoShowfrmSearch;
    frmSearch.ShowModal;
    RefreshQuery(odsList);
  finally
    frmSearch.Free;
  end;
end;

procedure TfrmMain.aShowExecute(Sender: TObject);
begin
  cxSplitter1.OpenSplitter;
end;

procedure TfrmMain.aSnimokExecute(Sender: TObject);
var Reg : TRegistry;
    ods : TOracleDataSet;
    sGuid, sIB : string;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey:=HKEY_LOCAL_MACHINE;
    if not Reg.OpenKeyReadOnly('\Software\Alda\MultiVox\Installation') then
      begin
        ods := TOracleDataSet.Create(nil);
        try
          ods.Session := frmMain.os;
          ods.Cursor := crSQLWait;
          ods.SQL.Text := ' select fc_guid from asu.vnaz_guid where fk_nazid = :pfk_nazid ';
          ods.DeclareAndSet('pfk_nazid', otInteger, odsList.FieldByName('fk_id').AsInteger);
          ods.Open;
          sGuid := ods.FieldByName('fc_guid').AsString;
          ods.DeleteVariables;
          ods.Close;
          ods.SQL.Text := ' select asu.get_ib(:pfk_pacid) as numib from dual ';
          ods.DeclareAndSet('pfk_pacid', otInteger, odsList.FieldByName('fk_pacid').AsInteger);
          ods.Open;
          sIB := ods.FieldByName('numib').AsString;
          DoShowSnimki(sIB,
                       '',
                       sGuid,
                       frmMain.get_dicom_ip,
                       frmMain.get_dicom_port,
                       frmMain.get_dicom_called,
                       frmMain.sCallingAET,
                       IntToStr(frmMain.pSotrID),
                       frmMain.dicom_show_3d);
        finally
          ods.Free;
        end;
        end else
        begin
          frmMain.sPath := Reg.ReadString('Path');
          ShellExecute(Application.Handle,
                       pChar('open'),
                       pChar(frmMain.sPath+'MvLauncher.exe'),
                       PChar('-cmd:Load -StudyExternalID:'+IntToStr(odsList.FieldByName('fk_id').AsInteger)),
                       pChar(frmMain.sPath),
                       SW_SHOWNORMAL);
        end;
  finally
    Reg.Free;
  end;
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

procedure TfrmMain.cxPrOtmenaPropertiesEditValueChanged(Sender: TObject);
begin
  if cxPrOtmena.EditValue = 1 then
    begin
      if cxPrSotr.EditValue = 1 then
        begin
          odsList.Filtered := True;
          odsList.Filter := 'fk_ispolid = '+IntToStr(pSotrID);
        end else
        begin
          odsList.Filtered := False;
        end;
    end else
    begin
      if cxPrSotr.EditValue = 1 then
        begin
          odsList.Filtered := True;
          odsList.Filter := '(fk_nazsosid <> '+ IntToStr(get_nazcancel)+') and (fk_ispolid = '+IntToStr(pSotrID)+')';
        end else
        begin
          odsList.Filtered := True;
          odsList.Filter := 'fk_nazsosid <> '+ IntToStr(get_nazcancel);
        end;
    end;
end;

procedure TfrmMain.cxPrSotrPropertiesEditValueChanged(Sender: TObject);
begin
  if cxPrSotr.EditValue = 1 then
    begin
      if cxPrOtmena.EditValue <> 1 then
        begin
          odsList.Filtered := True;
          odsList.Filter := '(fk_ispolid = '+ IntToStr(pSotrID)+ ') and (fk_nazsosid <> '+IntToStr(get_nazcancel)+')';
        end else
        begin
          odsList.Filtered := True;
          odsList.Filter := 'fk_ispolid = '+ IntToStr(pSotrID);
        end;
    end else
    begin
      if cxPrOtmena.EditValue <> 1 then
        begin
          odsList.Filtered := True;
          odsList.Filter := 'fk_nazsosid <> '+IntToStr(get_nazcancel);
        end else
        begin
          odsList.Filtered := False;
        end;
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
  if VarName = 'PACAGE' then Value := odsList.FieldByName('AGE').AsInteger;
  if VarName = 'PACFIO' then Value := odsList.FieldByName('FIOPAC').AsString;
  if VarName = 'RUNDATE' then Value := odsList.FieldByName('FD_RUN_STR').AsString;
  if VarName = 'ISSLNAME' then Value := odsList.FieldByName('FC_NAME').AsString;
  if VarName = 'ISSLTEXT' then Value := sTextIssl_4Rep;
  if is_digsig = True then
    begin
      if VarName = 'SOTRNAME' then Value := 'ЭЦП '+odsList.FieldByName('ISPOLFIO').AsString
    end else
    begin
      if VarName = 'SOTRNAME' then Value := odsList.FieldByName('ISPOLFIO').AsString;
    end;
  if VarName = 'PHONEKAB' then Value := sPhone_4Rep;
  if VarName = 'MEDOTRADESIGN' then Value := MedotradeSign;
end;

procedure TfrmMain.frxRepProsmotr_SOKBGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'PACAGE' then Value := odsList.FieldByName('AGE').AsInteger;
  if VarName = 'PACFIO' then Value := odsList.FieldByName('FIOPAC').AsString;
  if VarName = 'RUNDATE' then Value := odsList.FieldByName('FD_RUN_STR').AsString;
  if VarName = 'ISSLNAME' then Value := odsList.FieldByName('FC_NAME').AsString;
  if VarName = 'ISSLTEXT' then Value := sTextIssl_4Rep;
  if is_digsig = True then
    begin
      if VarName = 'SOTRNAME' then Value := 'ЭЦП '+odsList.FieldByName('ISPOLFIO').AsString
    end else
    begin
      if VarName = 'SOTRNAME' then Value := odsList.FieldByName('ISPOLFIO').AsString;
    end;
  if VarName = 'PHONEKAB' then Value := sPhone_4Rep;
  if VarName = 'MEDOTRADESIGN' then Value := MedotradeSign;
end;

procedure TfrmMain.frxRepProsmotr_TravmaGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := sOtdelName_4Rep;
  if VarName = 'PACAGE' then Value := odsList.FieldByName('AGE').AsInteger;
  if VarName = 'PACFIO' then Value := odsList.FieldByName('FIOPAC').AsString;
  if VarName = 'RUNDATE' then Value := odsList.FieldByName('FD_RUN_STR').AsString;
  if VarName = 'ISSLNAME' then Value := odsList.FieldByName('FC_NAME').AsString;
  if VarName = 'ISSLTEXT' then Value := sTextIssl_4Rep;
  if VarName = 'SPEC' then Value := sSpec_4Rep;  
  if is_digsig = True then
    begin
      if VarName = 'SOTRNAME' then Value := 'ЭЦП '+odsList.FieldByName('ISPOLFIO').AsString
    end else
    begin
      if VarName = 'SOTRNAME' then Value := odsList.FieldByName('ISPOLFIO').AsString;
    end;
  if VarName = 'PHONEKAB' then Value := sPhone_4Rep;
  if VarName = 'MEDOTRADESIGN' then Value := MedotradeSign;
end;

function TfrmMain.GetLastTalonID(App_HND: THandle; OS: TORacleSession; pPacID, pSotrID, pTalonID: Integer): integer;
var AAmbTalonHandle: THandle;
    str: string;
    GetAmbtalonId: function(App_HND: THandle; OS: TORacleSession; pPacID, pSOTRID, pTalonID:Integer):LongInt; stdcall;
begin
  Result := -1;
  AAmbTalonHandle := LoadLibrary('AMBTalonDLL.dll');
  if AAmbTalonHandle > HINSTANCE_ERROR then
    begin
      @GetAmbtalonId := GetProcAddress(AAmbTalonHandle, 'InitPluginGetAmbtalonId');
      if @GetAmbtalonId <> nil then
        begin
          try
            Result := GetAmbtalonId(App_HND,OS,pPacID, frmMain.pSOTRID, pTalonID);
          except
            on E:Exception do
              begin
                str := 'Ошибка при загрузке внешнего модуля'+sLineBreak+e.Message;
                Application.MessageBox(PChar(str), 'Ошибка', MB_OK + MB_ICONINFORMATION);
              end;
          end;
        end;
      FreeLibrary(AAmbTalonHandle);
    end;
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
  if odsList.RecordCount <> 0 then
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

end.
